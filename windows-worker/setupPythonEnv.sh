#!/bin/bash

source windows.env
source buildmaster.env
function isadmin()
{
    # only for windows.
    net session > /dev/null 2>&1
    if [ $? -eq 0 ]; then echo "admin"
    else echo "user"; fi
}

kernel="$(uname -s)"

if [[ $kernel == MINGW64* ]]; then
    if [[ $(isadmin) == admin ]]; then
        python -m venv sandbox
        source sandbox/Scripts/activate
        pip install --upgrade --trusted-host pypi.org pip incremental pywin32 buildbot[bundle] pyopenssl service_identity
        # this is why we ned to be admin:
        python sandbox/Scripts/pywin32_postinstall.py -install
        #
        buildbot-worker create-worker . "${BUILDMASTER:?}" "${WINDOWS_NAME:?}" "${WINDOWS_PASS:?}"
        echo "the only thing left for you to do is: get nssm and create a service using buildbot-worker-start.cmd"
        echo "note: in the gui, specify the local user + password"
        echo "note: after installation, the service does not run. you have to start it manually."
        echo "note: it should, however, start at boot."
    else
        echo "you need to run this terminal as administrator"
        exit 1
    fi
else
    echo "Error. This scrpit is intended for windows (mingw64)"
    exit 1
fi
