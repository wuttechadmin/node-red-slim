# A Node-Red Slim Container based from Node18-slim

Current size is __374MB__ with basic Node-Red UI.

## Multi-Stage Docker

Base and production ready images on `node18-slim`

## Usage

### Building Image

```bash
docker build -t node-red-slim:latest .
```
### Running Image

```bash
docker run -d --name=my-slim-nodered \
    -e NODERED_AUTH_ADMIN_USERNAME=admin \
    -e NODERED_AUTH_ADMIN_PASSWORD='$2a$08$zZWtXTja0fB1pzD4sHCMyOCMYz2Z6dNbM6tl8sJogENOMcxWV9DN.' \
    -p 1880:1880 \
    node-red-slim:latest
```
here the encrypted password is `password` as an example

### Build and Run using `docker-compose`

```bash
docker-compose build nodered-slim && docker-compose up
```

#### Build and Deploy to Swarm
```bash
docker-compose build nodered-slim && docker stack deploy --compose-file docker-compose.yml wuttech
```