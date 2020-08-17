# Raspberry Pi workers
dockerized buildbot-workers for various versions of the Raspberry Pi

## Prerequisites
- a physical Rasperry Pi
    - run `uname -m` to determine the architecture
- you have to have docker and docker-compose installed.
- add your unprivileged user to the docker group

## Setup
1. clone / copy this repository to the Raspberry Pi
   - (Optional) Create a branch for your configuration including secrets (git checkout -b secrets)
2. modify URL and port of the buildmaster in `buildmaster.env`
4. `cd` into the folder fitting your model (run `uname -m` if you are unsure)
   - modify the passphrase and worker name in the .env file
   - make sure that the buildmaster is configured with the same values
5. run docker-compose up -d

Note that docker-compose restarts the service automatically after reboots.
