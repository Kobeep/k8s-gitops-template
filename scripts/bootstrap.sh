#!/usr/bin/env bash
# Bootstrap both dev and prod clusters with full infrastructure
set -e

echo "INFO==> Starting bootstrap process"

# Check prerequisites
echo "INFO==> Checking prerequisites"
command -v docker >/dev/null 2>&1 || { echo "Error==> docker not found"; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo "Error==> kubectl not found"; exit 1; }
command -v k3d >/dev/null 2>&1 || { echo "Error==> k3d not found"; exit 1; }
command -v helm >/dev/null 2>&1 || { echo "Error==> helm not found"; exit 1; }

# Create DEV cluster
echo "INFO==> Creating DEV cluster"
if k3d cluster list | grep -q "k8s-dev"; then
    echo "Warning==> DEV cluster already exists, skipping"
else
    k3d cluster create --config clusters/dev/cluster-config.yaml
fi

# Create PROD cluster
echo "INFO==> Creating PROD cluster"
if k3d cluster list | grep -q "k8s-prod"; then
    echo "Warning==> PROD cluster already exists, skipping"
else
    k3d cluster create --config clusters/prod/cluster-config.yaml
fi

# Install ArgoCD on DEV
echo "INFO==> Installing ArgoCD on DEV"
kubectl config use-context k3d-k8s-dev
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=available --timeout=300s deployment/argocd-server -n argocd

# Install ArgoCD on PROD
echo "INFO==> Installing ArgoCD on PROD"
kubectl config use-context k3d-k8s-prod
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=available --timeout=300s deployment/argocd-server -n argocd

# Deploy root applications
echo "INFO==> Deploying root applications"
kubectl config use-context k3d-k8s-dev
kubectl apply -f clusters/dev/argocd-apps/root-app.yaml

kubectl config use-context k3d-k8s-prod
kubectl apply -f clusters/prod/argocd-apps/root-app.yaml

# Get ArgoCD passwords
echo "INFO==> ArgoCD credentials:"
kubectl config use-context k3d-k8s-dev
DEV_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "  DEV:  admin / ${DEV_PASSWORD}"

kubectl config use-context k3d-k8s-prod
PROD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "  PROD: admin / ${PROD_PASSWORD}"

echo "INFO==> Bootstrap completed successfully"
