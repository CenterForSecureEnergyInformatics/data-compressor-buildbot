# zse-raspberry-pi-workers
dockerized buildbot-workers for various versions of the raspberry-pi

## Prerequisites
- you have to have docker and docker-compose installed.
- add your unprivileged user to the docker group

## Setup
* clone / copy this repository to a raspberry-pi.
  * (Optional) Create a branch for your configuration including secrets (git checkout -b secrets)
* modify URL and port of the buildmaster in buildmaster.env.
* cd into the folder fitting your model (run uname -m if you are unsure)
  * modify the passphrase and worker name in the .env file
  * make sure that the buildmaster is configured with the same values
* run docker-compose up -d
