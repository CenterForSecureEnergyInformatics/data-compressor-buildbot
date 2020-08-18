# Windows-worker
Buildbot-worker on Windows 10 pro

## Prerequisites
- A working Windows 10 pro setup.
   - Set a password for your user
- Git including Git Bash. Download the current version here: https://git-scm.com/download/win
- Microsoft C++ Build Toolsi 2019. Download: https://visualstudio.microsoft.com/de/downloads/
- Python. Currently verison 3.8.2 is in use. Download: https://www.python.org/downloads/
## Warning
Some problem prevents a tls connection between the buildbot-worker on windows and the reverse proxy (traefik) in front of the buildmaster.
Because of this, tls is deactivated!
Make sure to establish the connection between worker and buildmaster in a trusted environment only.
Currently, the buildmaster and the windows-vm share a subnet for this purpose.
## Setup
1. Clone / copy this repository to your windows host
   * (Optional) Create a branch for your configuration including secrets (git checkout -b secrets)
2. Modify URL and port of the buildmaster in [buildmaster.env](buildmaster.env)
3. Modify the passphrase and worker name in [windows.env](windows.env)
   * Make sure that the buildmaster is configured with the same values
4. Change the username and password in the file [setupPythonEnv.py](setupPythonEnv.py)
4. Run Git-Bash as Administrator and navigate to this directory
   * Run `./setupPythonEnv.py`
