# Contributing to k8s-devops-template

Thank you for considering contributing to k8s-devops-template! 🎉

## How to Contribute

### Reporting Bugs

- Use GitHub Issues
- Include reproduction steps
- Provide environment details (OS, k3d version, etc.)

### Suggesting Features

- Open a GitHub Issue with `[Feature Request]` prefix
- Describe the use case
- Explain why it would benefit DevOps engineers

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit with clear messages (`git commit -m 'Add amazing feature'`)
6. Push to your fork (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Code Standards

- Follow existing code style
- Add comments for complex logic
- Update documentation
- Test your changes with `make test`
- Validate manifests with `make validate`

## Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/k8s-devops-template.git

# Install prerequisites
./scripts/install-prerequisites.sh

# Bootstrap dev environment
make bootstrap-dev
```

## Testing

```bash
# Run all tests
make test

# Validate manifests
make validate

# Check cluster status
make status
```

## Questions?

Feel free to open an issue or reach out to maintainers.

Thank you! 🙏
