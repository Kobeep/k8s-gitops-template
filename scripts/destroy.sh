#!/usr/bin/env bash
# Destroy all clusters and cleanup resources
set -e

echo "Warning==> About to destroy all clusters"
read -p "Type 'yes' to confirm: " -r
if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "INFO==> Aborted"
    exit 0
fi

# Delete DEV cluster
if k3d cluster list | grep -q "k8s-dev"; then
    echo "INFO==> Deleting DEV cluster"
    k3d cluster delete k8s-dev
else
    echo "Warning==> DEV cluster not found"
fi

# Delete PROD cluster
if k3d cluster list | grep -q "k8s-prod"; then
    echo "INFO==> Deleting PROD cluster"
    k3d cluster delete k8s-prod
else
    echo "Warning==> PROD cluster not found"
fi

# Cleanup Docker resources
echo "INFO==> Cleaning up Docker resources"
docker rm -f k8s-dev-registry 2>/dev/null || true
docker rm -f k8s-prod-registry 2>/dev/null || true
docker network rm k8s-dev-network 2>/dev/null || true
docker network rm k8s-prod-network 2>/dev/null || true

echo "INFO==> Cleanup completed"
