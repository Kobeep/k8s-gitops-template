#!/usr/bin/env bash
# Install required tools for k8s-gitops-template
set -e

echo "INFO==> Installing prerequisites"

OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          echo "Error==> Unsupported OS: ${OS}"; exit 1;;
esac

echo "INFO==> Detected OS: ${MACHINE}"

# Install k3d
if ! command -v k3d &> /dev/null; then
    echo "INFO==> Installing k3d"
    curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
else
    echo "INFO==> k3d already installed"
fi

# Install kubectl
if ! command -v kubectl &> /dev/null; then
    echo "INFO==> Installing kubectl"
    if [ "$MACHINE" = "Linux" ]; then
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        rm kubectl
    elif [ "$MACHINE" = "Mac" ]; then
        brew install kubectl
    fi
else
    echo "INFO==> kubectl already installed"
fi

# Install Helm
if ! command -v helm &> /dev/null; then
    echo "INFO==> Installing Helm"
    curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
else
    echo "INFO==> Helm already installed"
fi

# Install ArgoCD CLI
if ! command -v argocd &> /dev/null; then
    echo "INFO==> Installing ArgoCD CLI"
    if [ "$MACHINE" = "Linux" ]; then
        curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
        sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
        rm argocd-linux-amd64
    elif [ "$MACHINE" = "Mac" ]; then
        brew install argocd
    fi
else
    echo "INFO==> ArgoCD CLI already installed"
fi

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "Error==> Docker not found"
    echo "Install from: https://docs.docker.com/get-docker/"
    exit 1
else
    echo "INFO==> Docker already installed"
fi

echo "INFO==> All prerequisites installed"
echo "INFO==> Run: ./scripts/bootstrap.sh"
