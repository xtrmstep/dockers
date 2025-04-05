# Portainer

[Portainer](https://www.portainer.io/) is an open-source lightweight management UI which allows you to easily manage your Docker and Kubernetes environments.

When started, you will need to configure the admin user and password. After that, you can start managing your containers.

## Usage

At first, you need to create a volume for Portainer data and luanch the container:

```bash
docker volume create portainer_data
docker-compose up -d
```

Then in browser, open http://localhost:5900 and configure the admin user and password. The local Docker environment will be automatically detected and you can start managing your containers.
