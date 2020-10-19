# Raspberry Pi workers
Dockerized buildbot-workers for various versions of the Raspberry Pi.

## Prerequisites
- A physical Rasperry Pi
    - Run `uname -m` to determine the architecture
- You have to have docker and docker-compose installed.
- Add your unprivileged user to the docker group

## Setup
1. Clone / copy this repository to the Raspberry Pi
   - (Optional) Create a branch for your configuration including secrets (`git checkout -b secrets`)
2. Modify URL and port of the buildmaster in [buildmaster.env](buildmaster.env)
4. `cd` into the folder fitting your model (run `uname -m` if you are unsure)
   - Modify the passphrase and worker name in the `.env` file
   - Make sure that the buildmaster is configured with the same values
5. Run `docker-compose up -d`

Note that docker-compose restarts the service automatically after reboots.
