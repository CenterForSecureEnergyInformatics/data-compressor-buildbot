# zse-windows-worker
buildbot-worker on windows 10

## Prerequisites
- git (you need git bash)
- Microsoft C++ Build Tools
- python3
- NSSM - the Non-Sucking Service Manager (https://nssm.cc/)
- set a password for your user
## Warning
Some problem prevents a tls connection between the buildbot-worker on windows and the reverse proxy (traefik) in front of the buildmaster.
Because of this, tls is deactivated!
Make sure to establish the connection between worker and buildmaster in a trusted environment only
## Setup
* clone / copy this repository to your windows host
  * (Optional) Create a branch for your configuration including secrets (git checkout -b secrets)
* modify URL and port of the buildmaster in buildmaster.env
* modify the passphrase and worker name in the .env file
  * make sure that the buildmaster is configured with the same values
* run Git-Bash as Administrator
  * run setupPythonEnv.py
* run nssm.exe as Administrator and create a new service that calls buildbot-worker-start.cmd
  * use your local user and password for the service
