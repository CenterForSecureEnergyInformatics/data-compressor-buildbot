# buildbot-buildmaster
This project contains dockerized services, serving a buildbot buildmaster to the public web over tls.
It is intended to be used on a linux server.
Currently, it runs under Debian Buster.
## Setup
- clone this repository to your server. 
- install docker and docker-compose.
- create a dedicated, unprivileged user for this project
- add the user to the docker group
- clone this repository to your server. You only need the folder containing this README.
  - optional: create a branch for your secrets (git checkout -b secrets)
- follow the setup instructions in the subfolders. Start with traefik and then buildbot.

This project comes mostly preconfigured.

What you have to do - an overview (refer to the README files in the subfolders):
- changing passwords / specifying credentials (see buildbot/README.md)
- providing a certificate for tls connections (traefik/certs)
- adjusting the web url (buildbot/docker-compose.yml)
- creating a persistent data directory
- adjusting file permissions

## Usage
- cd traefik
- docker-compose up -d
- cd ../buildbot
- docker-compose up -d

You might have to restart traefik again, when workers can't connect to the buildmaster.
Typically the raspberry-pis have this problem.
