# buildbot-buildmaster
This project contains dockerized services, serving a buildbot buildmaster to the public WEB over TLS.
It is intended to be used on a Linux server.
Currently, it runs under Debian Buster.
## Setup
1. Clone this repository to your server. 
2. Install docker and docker-compose.
3. Create a dedicated, unprivileged user for this project
4. Add the user to the docker group
5. Clone this repository to your server. You only need the folder containing this README.
   - Optional: create a branch for your secrets (git checkout -b secrets)
6. Follow the setup instructions in the subfolders. Start with traefik and then buildbot.

This project comes mostly preconfigured.

What you have to do - an overview (refer to the README files in the subfolders):
- Changing passwords / specifying credentials (see [buildbot/README.md](buildbot/README.md))
- Providing a certificate for TLS connections ([traefik/certs](traefik/certs))
- Adjusting the WEB URL ([buildbot/docker-compose.yml](buildbot/docker-compose.yml))
- Creating a persistent data directory (see [buildbot/README.md](buildbot/README.md))
- Adjusting file permissions (traefik and buildbot secrets)

## Usage
 ```
 cd traefik
 docker-compose up -d
 cd ../buildbot
 docker-compose up -d
 ```

You might have to restart traefik again, when workers can't connect to the buildmaster.
Typically the raspberry-pis have this problem.
