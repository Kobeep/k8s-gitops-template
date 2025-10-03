#!/usr/bin/env bash
# Display status of all clusters and components

echo "INFO==> Cluster Status"
echo ""
echo "K3D Clusters:"
k3d cluster list
echo ""

# Check DEV cluster
if k3d cluster list | grep -q "k8s-dev"; then
    echo "INFO==> DEV Cluster"
    kubectl config use-context k3d-k8s-dev 2>/dev/null
    kubectl get nodes
    echo ""
    kubectl get namespaces
    echo ""
    kubectl get applications -n argocd 2>/dev/null || echo "Warning==> ArgoCD not installed"
    echo ""
fi

# Check PROD cluster
if k3d cluster list | grep -q "k8s-prod"; then
    echo "INFO==> PROD Cluster"
    kubectl config use-context k3d-k8s-prod 2>/dev/null
    kubectl get nodes
    echo ""
    kubectl get namespaces
    echo ""
    kubectl get applications -n argocd 2>/dev/null || echo "Warning==> ArgoCD not installed"
    echo ""
fi

# Check Docker registries
echo "Docker Registries:"
docker ps --filter "name=registry" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" 2>/dev/null || true
echo ""
