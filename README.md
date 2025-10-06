<div align="center">
  <h1>🚀 K8s GitOps Template</h1>

  <p>
    <strong>Production-ready Kubernetes GitOps template with automated local clusters, full observability stack, and security policies</strong>
  </p>

  <p>
    <a href="https://github.com/Kobeep/k8s-gitops-template/actions/workflows/ci.yml">
      <img src="https://github.com/Kobeep/k8s-gitops-template/actions/workflows/ci.yml/badge.svg" alt="CI Pipeline">
    </a>
    <a href="https://github.com/Kobeep/k8s-gitops-template/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/Kobeep/k8s-gitops-template.svg?style=for-the-badge" alt="Contributors">
    </a>
    <a href="https://github.com/Kobeep/k8s-gitops-template/network/members">
      <img src="https://img.shields.io/github/forks/Kobeep/k8s-gitops-template.svg?style=for-the-badge" alt="Forks">
    </a>
    <a href="https://github.com/Kobeep/k8s-gitops-template/stargazers">
      <img src="https://img.shields.io/github/stars/Kobeep/k8s-gitops-template.svg?style=for-the-badge" alt="Stargazers">
    </a>
    <a href="https://github.com/Kobeep/k8s-gitops-template/issues">
      <img src="https://img.shields.io/github/issues/Kobeep/k8s-gitops-template.svg?style=for-the-badge" alt="Issues">
    </a>
    <a href="https://github.com/Kobeep/k8s-gitops-template/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/Kobeep/k8s-gitops-template.svg?style=for-the-badge" alt="MIT License">
    </a>
  </p>

  <p>
    <a href="https://github.com/Kobeep/k8s-gitops-template"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#-getting-started">View Demo</a>
    ·
    <a href="https://github.com/Kobeep/k8s-gitops-template/issues/new?labels=bug">Report Bug</a>
    ·
    <a href="https://github.com/Kobeep/k8s-gitops-template/issues/new?labels=enhancement">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>📋 Table of Contents</summary>
  <ol>
    <li>
      <a href="#-about-the-project">About The Project</a>
      <ul>
        <li><a href="#-built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#-getting-started">Getting Started</a>
      <ul>
        <li><a href="#-prerequisites">Prerequisites</a></li>
        <li><a href="#-installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#-usage">Usage</a></li>
    <li><a href="#-project-structure">Project Structure</a></li>
    <li><a href="#-architecture">Architecture</a></li>
    <li><a href="#-cicd">CI/CD</a></li>
    <li><a href="#-contributing">Contributing</a></li>
    <li><a href="#-license">License</a></li>
    <li><a href="#-contact">Contact</a></li>
    <li><a href="#-acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## 🎯 About The Project

This project provides a **complete, production-ready Kubernetes template** designed for DevOps engineers who want to quickly set up a local Kubernetes environment with GitOps principles, comprehensive monitoring, and security best practices.

**Key Highlights:**
* 🏗️ **Automated Setup**: Two k3d clusters (dev & prod) deployed with a single command
* 🔄 **GitOps Workflow**: ArgoCD-based continuous deployment with declarative configuration
* 📊 **Full Observability**: Prometheus, Grafana, and Loki for complete monitoring and logging
* 🔒 **Security First**: Kyverno policies for automated security enforcement
* 🚀 **Production-Ready**: Separate dev and prod environments with proper isolation
* � **Easy to Extend**: Well-structured platform components using Helm charts

This template is perfect for learning Kubernetes, testing applications locally, or as a starting point for your own GitOps infrastructure.

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

### � Built With

This project leverages the following major frameworks and tools:

* [![Kubernetes][Kubernetes-badge]][Kubernetes-url]
* [![Docker][Docker-badge]][Docker-url]
* [![ArgoCD][ArgoCD-badge]][ArgoCD-url]
* [![Prometheus][Prometheus-badge]][Prometheus-url]
* [![Grafana][Grafana-badge]][Grafana-url]
* [![Helm][Helm-badge]][Helm-url]

**Platform Components:**
- **k3d** - Lightweight Kubernetes clusters in Docker
- **ArgoCD** - GitOps continuous delivery tool
- **Ingress NGINX** - Kubernetes Ingress controller
- **Prometheus Stack** (kube-prometheus-stack v55.5.0) - Monitoring and alerting
- **Grafana** - Metrics visualization and dashboards
- **Loki** (v2.9.0) - Log aggregation system
- **Promtail** - Log collector for Loki
- **Kyverno** (v1.11.0) - Kubernetes policy engine

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- GETTING STARTED -->
## 🚀 Getting Started

Follow these steps to get your local Kubernetes clusters up and running with all platform components deployed.

### � Prerequisites

Before you begin, ensure you have the following tools installed on your system:

* **Docker** (20.10+)
  ```sh
  # Verify installation
  docker --version
  ```

* **kubectl** (1.28+)
  ```sh
  # Verify installation
  kubectl version --client
  ```

* **k3d** (5.6+)
  ```sh
  # Verify installation
  k3d version
  ```

* **Helm** (3.12+)
  ```sh
  # Verify installation
  helm version
  ```

### � Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/Kobeep/k8s-gitops-template.git
   cd k8s-gitops-template
   ```

2. **Install prerequisites** (if needed)
   ```sh
   ./scripts/install-prerequisites.sh
   ```

3. **Bootstrap both clusters**
   ```sh
   ./scripts/bootstrap.sh
   ```

   This will:
   - ✅ Create k3d dev cluster (1 server + 2 agents)
   - ✅ Create k3d prod cluster (1 server + 3 agents)
   - ✅ Install ArgoCD on both clusters
   - ✅ Deploy root applications
   - ✅ Configure GitOps sync

4. **Verify cluster status**
   ```sh
   ./scripts/status.sh
   ```

5. **Get ArgoCD credentials**

   The bootstrap script will output the ArgoCD admin passwords for both clusters. You can also retrieve them manually:

   ```sh
   # DEV cluster
   kubectl config use-context k3d-k8s-dev
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

   # PROD cluster
   kubectl config use-context k3d-k8s-prod
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
   ```

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## 💡 Usage

### Managing Clusters

**Bootstrap Clusters:**
```sh
# Bootstrap both dev and prod clusters
./scripts/bootstrap.sh
```

**Switch Between Clusters:**
```sh
# Switch to dev cluster
kubectl config use-context k3d-k8s-dev

# Switch to prod cluster
kubectl config use-context k3d-k8s-prod
```

**Check Cluster Status:**
```sh
./scripts/status.sh
```

**Destroy Clusters:**
```sh
./scripts/destroy.sh
```

### Accessing Services

**ArgoCD:**
```sh
# Dev cluster - http://localhost:8080
kubectl port-forward -n argocd svc/argocd-server 8080:443 --context k3d-k8s-dev

# Prod cluster - http://localhost:9080
kubectl port-forward -n argocd svc/argocd-server 9080:443 --context k3d-k8s-prod
```

**Grafana:**
```sh
# Access via Prometheus Stack service
kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana 3000:80
```

**Prometheus:**
```sh
# Access Prometheus UI
kubectl port-forward -n monitoring svc/kube-prometheus-stack-prometheus 9090:9090
```

### Deploying Applications

ArgoCD automatically syncs applications from the `clusters/{dev,prod}/argocd-apps/` directory. To add new applications:

1. Create an ArgoCD Application manifest in the appropriate cluster directory
2. Commit and push to the repository
3. ArgoCD will automatically detect and sync the new application

**Example Application:**
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app-dev
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/Kobeep/k8s-gitops-template.git
    targetRevision: main
    path: apps/my-app
  destination:
    server: https://kubernetes.default.svc
    namespace: dev
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- PROJECT STRUCTURE -->
## 📁 Project Structure

```
k8s-gitops-template/
├── clusters/                         # Cluster-specific configurations
│   ├── dev/
│   │   ├── cluster-config.yaml      # k3d dev cluster config (1 server + 2 agents)
│   │   │                            # Ports: HTTP:8080, HTTPS:8443, NodePort:30000-30010
│   │   └── argocd-apps/             # ArgoCD Applications for dev
│   │       ├── root-app.yaml        # Root app of apps pattern
│   │       ├── platform.yaml        # Platform components (monitoring, logging, etc.)
│   │       └── apps.yaml            # Application deployments
│   └── prod/
│       ├── cluster-config.yaml      # k3d prod cluster config (1 server + 3 agents)
│       │                            # Ports: HTTP:9080, HTTPS:9443, NodePort:31000-31010
│       └── argocd-apps/             # ArgoCD Applications for prod
│           ├── root-app.yaml
│           ├── platform.yaml
│           └── apps.yaml
│
├── platform/                         # Platform components (Helm umbrella charts)
│   ├── ingress-nginx/               # Ingress NGINX Controller
│   │   ├── Chart.yaml               # v4.8.3
│   │   ├── values.yaml              # Default values
│   │   ├── values-dev.yaml          # Dev-specific overrides
│   │   └── values-prod.yaml         # Prod-specific overrides
│   │
│   ├── monitoring/                  # Prometheus + Grafana
│   │   ├── Chart.yaml               # kube-prometheus-stack v55.5.0
│   │   ├── values.yaml
│   │   ├── values-dev.yaml
│   │   └── values-prod.yaml
│   │
│   ├── logging/                     # Loki + Promtail
│   │   ├── Chart.yaml               # Loki v5.41.4, Promtail v6.15.3
│   │   ├── values.yaml
│   │   ├── values-dev.yaml
│   │   └── values-prod.yaml
│   │
│   └── security/                    # Kyverno policies
│       ├── Chart.yaml               # Kyverno v3.1.4
│       ├── values.yaml
│       ├── values-dev.yaml
│       └── values-prod.yaml
│
├── scripts/                          # Automation scripts
│   ├── bootstrap.sh                 # Bootstrap both clusters
│   ├── destroy.sh                   # Destroy all clusters
│   ├── status.sh                    # Check cluster status
│   └── install-prerequisites.sh     # Install required tools
│
├── CONTRIBUTING.md                   # Contribution guidelines
├── LICENSE                          # MIT License
└── README.md                        # This file
```

**Key Design Principles:**
* **Separation of Concerns**: Platform components are separate from applications
* **GitOps-Native**: Everything is declarative and stored in Git
* **Environment Parity**: Dev and prod use the same structure with different values
* **Helm-Based**: All platform components use Helm for easy customization
* **App of Apps Pattern**: ArgoCD manages multiple applications through a root app

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- ARCHITECTURE -->
## 🏗 Architecture

### Cluster Architecture

```
┌──────────────────────────────────────────────────────────────────────┐
│                         GitHub Repository                             │
│                      (GitOps Source of Truth)                        │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             │ ArgoCD pulls manifests
                             │ and syncs to clusters
                             │
              ┌──────────────┴──────────────┐
              │                             │
    ┌─────────▼──────────┐        ┌────────▼──────────┐
    │   Dev Cluster      │        │   Prod Cluster    │
    │   (k3d)            │        │   (k3d)           │
    ├────────────────────┤        ├───────────────────┤
    │ • 1 server         │        │ • 1 server        │
    │ • 2 agents         │        │ • 3 agents        │
    │                    │        │                   │
    │ Ports:             │        │ Ports:            │
    │ • HTTP: 8080       │        │ • HTTP: 9080      │
    │ • HTTPS: 8443      │        │ • HTTPS: 9443     │
    │ • NodePort:        │        │ • NodePort:       │
    │   30000-30010      │        │   31000-31010     │
    └────────────────────┘        └───────────────────┘
```

### Platform Components per Cluster

```
┌─────────────────────────────────────────────────────────────┐
│                    Kubernetes Cluster (k3d)                  │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  argocd namespace                                     │  │
│  │  • ArgoCD Server                                      │  │
│  │  • ArgoCD Application Controller                      │  │
│  │  • ArgoCD Repo Server                                 │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  ingress-nginx namespace                              │  │
│  │  • NGINX Ingress Controller                           │  │
│  │  • LoadBalancer Service                               │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  monitoring namespace                                 │  │
│  │  • Prometheus (metrics collection)                    │  │
│  │  • Grafana (visualization)                            │  │
│  │  • AlertManager (alerting)                            │  │
│  │  • Node Exporter (node metrics)                       │  │
│  │  • Kube State Metrics (k8s metrics)                   │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  logging namespace                                    │  │
│  │  • Loki (log aggregation)                             │  │
│  │  • Promtail (log collection)                          │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  security namespace                                   │  │
│  │  • Kyverno (policy engine)                            │  │
│  │  • Admission Controller                               │  │
│  │  • Background Controller                              │  │
│  │  • Reports Controller                                 │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  dev/prod namespaces                                  │  │
│  │  • Application workloads                              │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### GitOps Flow

```
1. Developer pushes changes to Git repository
                  ↓
2. ArgoCD detects changes automatically
                  ↓
3. ArgoCD pulls updated manifests
                  ↓
4. ArgoCD applies changes to cluster
                  ↓
5. Applications are deployed/updated
                  ↓
6. Monitoring & logging track the deployment
```

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- CI/CD -->
## 🔄 CI/CD

This project includes automated CI/CD pipelines using **GitHub Actions**.

### CI Pipeline

The CI pipeline runs automatically on every push and pull request to `main` or `develop` branches.

**Pipeline Stages:**

1. **YAML Validation** - Validates all YAML files using yamllint
2. **Kubernetes Validation** - Validates Kubernetes manifests with kubectl dry-run
3. **Helm Validation** - Lints all Helm charts in the platform directory
4. **Script Testing** - Runs shellcheck on all bash scripts
5. **Security Scanning** - Scans for vulnerabilities using Trivy
6. **Integration Testing** - Creates a test k3d cluster (PR only)
7. **Markdown Linting** - Validates markdown documentation

**Status Badge:**

[![CI Pipeline](https://github.com/Kobeep/k8s-gitops-template/actions/workflows/ci.yml/badge.svg)](https://github.com/Kobeep/k8s-gitops-template/actions/workflows/ci.yml)

### Running Tests Locally

Before pushing, you can run validations locally:

```sh
# Install dependencies
pip install yamllint
sudo apt-get install shellcheck

# Validate YAML
yamllint -c .yamllint .

# Check shell scripts
shellcheck scripts/*.sh

# Lint Helm charts
helm lint platform/monitoring/
helm lint platform/logging/
helm lint platform/security/
helm lint platform/ingress-nginx/

# Validate Kubernetes manifests
kubectl apply --dry-run=client -f clusters/dev/argocd-apps/
kubectl apply --dry-run=client -f clusters/prod/argocd-apps/
```

### Release Process

To create a new release:

```sh
# Create and push a tag
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

The release workflow will automatically:
- Create a GitHub release
- Generate a changelog from commits
- Tag the release with semantic versioning

For more details, see [`.github/workflows/README.md`](.github/workflows/README.md).

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- CONTRIBUTING -->
## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

For more details, please refer to [CONTRIBUTING.md](CONTRIBUTING.md).

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- LICENSE -->
## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- CONTACT -->
## 📧 Contact

Jakub Pospieszny - [@Kobeep](https://github.com/Kobeep)

Project Link: [https://github.com/Kobeep/k8s-gitops-template](https://github.com/Kobeep/k8s-gitops-template)

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## 🙏 Acknowledgments

This project was built using these amazing open-source tools:

* [k3d](https://k3d.io/) - Lightweight Kubernetes in Docker
* [ArgoCD](https://argoproj.github.io/cd/) - GitOps continuous delivery tool
* [Prometheus](https://prometheus.io/) - Monitoring and alerting toolkit
* [Grafana](https://grafana.com/) - Analytics and monitoring platform
* [Loki](https://grafana.com/oss/loki/) - Log aggregation system
* [Kyverno](https://kyverno.io/) - Kubernetes native policy management
* [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/) - Ingress controller for Kubernetes
* [Helm](https://helm.sh/) - The package manager for Kubernetes
* [Best-README-Template](https://github.com/othneildrew/Best-README-Template) - README template inspiration

<p align="right">(<a href="#-k8s-gitops-template">back to top</a>)</p>

---

<div align="center">
  <strong>Made with ❤️ for the DevOps community</strong>
  <br />
  <sub>If you find this project helpful, please consider giving it a ⭐</sub>
</div>

<!-- MARKDOWN LINKS & IMAGES -->
[Kubernetes-badge]: https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[Kubernetes-url]: https://kubernetes.io/
[Docker-badge]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/
[ArgoCD-badge]: https://img.shields.io/badge/ArgoCD-EF7B4D?style=for-the-badge&logo=argo&logoColor=white
[ArgoCD-url]: https://argoproj.github.io/cd/
[Prometheus-badge]: https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white
[Prometheus-url]: https://prometheus.io/
[Grafana-badge]: https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white
[Grafana-url]: https://grafana.com/
[Helm-badge]: https://img.shields.io/badge/Helm-0F1689?style=for-the-badge&logo=helm&logoColor=white
[Helm-url]: https://helm.sh/
