# 🚀 k8s-gitops-template

> **Production-ready Kubernetes DevOps template with automated local clusters (dev/prod), GitOps, monitoring, logging, security policies, and CI/CD pipelines.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.28+-blue.svg)](https://kubernetes.io/)
[![ArgoCD](https://img.shields.io/badge/GitOps-ArgoCD-orange.svg)](https://argoproj.github.io/cd/)

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This project provides a **complete, production-ready Kubernetes template** for DevOps engineers. It includes:

- 🏗️ Automated local Kubernetes clusters (dev & prod) using **k3d**
- 🔄 **GitOps** workflow with ArgoCD
- 📊 Full observability stack (Prometheus, Grafana, Loki)
- 🔒 Security policies (Kyverno, Pod Security, Network Policies)
- 🔐 RBAC configuration with namespace isolation
- 🚦 CI/CD pipelines with GitHub Actions
- 📦 Sample microservices with Helm charts
- 🔧 One-command setup with `make bootstrap`

## ✨ Features

### Platform Components

- **k3d**: Lightweight Kubernetes clusters in Docker
- **ArgoCD**: GitOps continuous delivery
- **Ingress NGINX**: Ingress controller with TLS support
- **cert-manager**: Automatic TLS certificate management
- **Prometheus Stack**: Monitoring and alerting
- **Grafana**: Visualization and dashboards
- **Loki**: Log aggregation
- **Kyverno**: Policy engine for Kubernetes
- **Sealed Secrets**: Encrypted secrets management

### DevOps Features

- ✅ Automated cluster provisioning
- ✅ Namespace isolation (dev/prod)
- ✅ RBAC roles and bindings
- ✅ Network policies
- ✅ Resource quotas and limits
- ✅ Pod Security Standards
- ✅ GitHub Actions CI/CD
- ✅ Helm charts for apps
- ✅ GitOps deployment workflow

## 🔧 Prerequisites

Required tools (install scripts provided):

- [Docker](https://docs.docker.com/get-docker/) (20.10+)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (1.28+)
- [k3d](https://k3d.io/) (5.6+)
- [Helm](https://helm.sh/docs/intro/install/) (3.12+)
- [ArgoCD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/) (2.8+)
- [make](https://www.gnu.org/software/make/)

### Quick Install

```bash
# Install all prerequisites (Linux/macOS)
./scripts/install-prerequisites.sh
```

## 🚀 Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/Kobeep/k8s-devops-template.git
cd k8s-devops-template
```

### 2. Bootstrap everything

```bash
# Create both dev and prod clusters with all components
make bootstrap
```

This single command will:
- Create k3d clusters (dev & prod)
- Install ArgoCD and configure GitOps
- Deploy monitoring stack (Prometheus, Grafana, Loki)
- Configure RBAC and security policies
- Deploy sample applications

### 3. Access services

```bash
# Get ArgoCD password
make argocd-password

# Access ArgoCD UI (http://localhost:8080)
make argocd

# Access Grafana (http://localhost:3000)
make monitoring

# Access Prometheus (http://localhost:9090)
make prometheus
```

### 4. Check status

```bash
# View cluster status
make status

# Switch between clusters
make dev    # Switch to dev cluster
make prod   # Switch to prod cluster
```

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    GitHub Repository                         │
│                    (GitOps Source)                          │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       │ ArgoCD Sync
                       │
        ┌──────────────┴──────────────┐
        │                             │
┌───────▼───────┐            ┌────────▼────────┐
│  Dev Cluster  │            │  Prod Cluster   │
│   (k3d)       │            │    (k3d)        │
├───────────────┤            ├─────────────────┤
│ • ArgoCD      │            │ • ArgoCD        │
│ • Ingress     │            │ • Ingress       │
│ • Prometheus  │            │ • Prometheus    │
│ • Grafana     │            │ • Grafana       │
│ • Loki        │            │ • Loki          │
│ • Kyverno     │            │ • Kyverno       │
│ • Sample Apps │            │ • Sample Apps   │
└───────────────┘            └─────────────────┘
```

See [Architecture Documentation](docs/architecture.md) for detailed diagrams.

## 📁 Project Structure

```
k8s-devops-template/
├── Makefile                          # Main automation commands
├── README.md                         # This file
├── .github/
│   └── workflows/                    # GitHub Actions CI/CD
│       ├── build-and-push.yml       # Build & push Docker images
│       ├── deploy-dev.yml           # Deploy to dev
│       └── deploy-prod.yml          # Deploy to prod
├── clusters/                         # Cluster configurations
│   ├── dev/
│   │   ├── cluster-config.yaml      # k3d dev cluster config
│   │   └── argocd-apps/             # ArgoCD app definitions
│   └── prod/
│       ├── cluster-config.yaml      # k3d prod cluster config
│       └── argocd-apps/             # ArgoCD app definitions
├── platform/                         # Platform components
│   ├── argocd/                      # ArgoCD installation
│   ├── ingress-nginx/               # Ingress controller
│   ├── cert-manager/                # Certificate management
│   ├── monitoring/                  # Prometheus, Grafana
│   ├── logging/                     # Loki, Promtail
│   ├── security/                    # Kyverno, policies
│   └── sealed-secrets/              # Sealed Secrets controller
├── apps/                            # Sample applications
│   ├── sample-app/
│   │   ├── helm/                    # Helm chart
│   │   ├── manifests/               # K8s manifests
│   │   └── src/                     # Application source
│   └── microservices/
│       ├── frontend/
│       ├── backend/
│       └── database/
├── rbac/                            # RBAC configurations
│   ├── dev/
│   │   ├── namespaces.yaml
│   │   ├── roles.yaml
│   │   └── rolebindings.yaml
│   └── prod/
│       ├── namespaces.yaml
│       ├── roles.yaml
│       └── rolebindings.yaml
├── policies/                        # Kyverno policies
│   ├── pod-security.yaml
│   ├── resource-limits.yaml
│   └── network-policies.yaml
├── scripts/                         # Automation scripts
│   ├── bootstrap.sh                 # Main bootstrap script
│   ├── bootstrap-cluster.sh         # Single cluster bootstrap
│   ├── destroy.sh                   # Destroy clusters
│   ├── status.sh                    # Check cluster status
│   ├── port-forward.sh              # Port forwarding helper
│   ├── deploy-apps.sh               # Deploy applications
│   ├── validate.sh                  # Validate manifests
│   └── install-prerequisites.sh     # Install required tools
└── tests/                           # Integration tests
    ├── cluster-tests.sh
    ├── app-tests.sh
    └── security-tests.sh
```

## 📖 Usage

### Cluster Management

```bash
# Bootstrap both clusters
make bootstrap

# Bootstrap only dev
make bootstrap-dev

# Bootstrap only prod
make bootstrap-prod

# Destroy all clusters
make destroy

# Check status
make status
```

### Switching Contexts

```bash
# Switch to dev cluster
make dev

# Switch to prod cluster
make prod
```

### Accessing Services

```bash
# ArgoCD
make argocd
make argocd-password

# Grafana
make monitoring

# Prometheus
make prometheus

# Alertmanager
make alertmanager
```

### Application Deployment

```bash
# Deploy sample applications
make deploy-apps

# Sync ArgoCD applications
make sync

# View application logs
make logs
```

### Validation & Testing

```bash
# Validate all manifests
make validate

# Run integration tests
make test
```

## 🔒 Security

This template includes:

- **Pod Security Standards**: Enforced at namespace level
- **Network Policies**: Restrict pod-to-pod communication
- **RBAC**: Fine-grained access control
- **Kyverno Policies**: Automated policy enforcement
- **Sealed Secrets**: Encrypted secrets in Git

See [Security Documentation](docs/security.md) for details.

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [k3d](https://k3d.io/) - Lightweight Kubernetes in Docker
- [ArgoCD](https://argoproj.github.io/cd/) - GitOps continuous delivery
- [Prometheus](https://prometheus.io/) - Monitoring and alerting
- [Grafana](https://grafana.com/) - Visualization platform
- [Kyverno](https://kyverno.io/) - Kubernetes policy engine

---

**Made with ❤️ for the DevOps community**
