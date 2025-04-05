# Docker-Compose Definitions for Open Source Tools

This repository provides a curated collection of Docker-Compose configurations for various open-source tools. These setups are designed to facilitate local development and testing. **Note:** These configurations are not intended for production use.

## Getting Started

### Recommended Containers

1. **[Portainer](compose/portainer/):** Start with Portainer, a powerful container management tool. It simplifies the management of your Docker environment and other containers.
2. **[PostgreSQL](compose/postgre/):** Set up PostgreSQL next, as it serves as a dependency for many other tools in this catalog.

### Setting Up a Common Network

To enable seamless communication between containers, create a shared Docker network:

```bash
docker network create local-sandbox-networks
```

This network ensures that all containers can interact with each other effectively.
