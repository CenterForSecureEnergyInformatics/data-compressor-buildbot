# Reverse Proxy (traefik)
This folder contains the configuration for the reverse proxy in front of the buildbot buildmaster.
It is based on the traefik project: https://containo.us/traefik/

The proxy handles TLS connections and automatically redirects from port 80 to port 443.
Furthermore, it listens on port 9989 and provides a TLS connection for buildbot-workers to the buildmaster.

The services behind traefik reside in private networks, only the ports needed are exposed to the internet.

Traefik needs access to the docker-socket: `var/run/docker.sock`.
Since this could result in vulnerabilities, the socket is made available over a socket-proxy (image: `tecnativa/docker-socket-proxy`), which runs as a service next to traefik.

The automatically obtained certs are extracted from [acme.json](acme.json) by the dockerized service `cert-dumper` (image: `ldez/traefik-certs-dumper:v2.7.0`) and stored in the folder [dynamic](dynamic).
## Usage
This project is dockerized and uses docker-compose.
The file docker-compose.yml tells docker-compose what to do, so you have to change into the directory containing the file, before executing any of these commands!
### Starting
- `docker-compose up -d`

or to restart
- `docker-compose restart`

Note: If the Raspberry Pis can't connect to the buildmaster, simply run `docker-compose` restart.
### Stopping
- `docker-compose down`
### Updating
Run the following steps in this order:
```
docker-compose down
docker-compose pull
docker-compose build
docker image prune
docker-compose up -d
```
### Debugging
To view logs in realtime, run
- `docker-compose logs -f`

Exit with `CTRL+C`

## Setup / Configuration
Traefik has a static configuration ([docker-compose.yml](docker-compose.yml) and [traefik.yml](traefik.yml)) and a dynamic configuration ([acme.json](acme.json) and [dynamic](dynamic)).
Trafik handles certificate renewals automatically.
The certificates are stored in [acme.json](acme.json).
The service `cert-dumper` extracts and stores the certificates in the folder [dump](dump).

### Steps:

You have to change the file permissions for [acme.json](acme.json) and [dynamic](dynamic).
Todo so, run:
- `chmod 600 acme.json`
- `chmod 600 acme.json`

For the `cert-dumper` to be able to create files under a username running the services, you have to add the following to your `~/.bashrc`:

```
export COMPOSE_UID=$(id -u)
export COMPOSE_GID=$(id -g)
```

### Configuration of services behind traefik:
The services handled by traefik are configured via labels in the corresponding docker-compose.yml files, in our case [../buildbot/docker-compose.yml](../buildbot/docker-compose.yml).
Please refer to [../buildbot/README.md](../buildbot/README.md) for setup instructions.

