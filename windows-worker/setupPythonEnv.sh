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
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -W )"

    if [[ $(isadmin) == admin ]]; then
        python -m venv sandbox
        source sandbox/Scripts/activate
        pip install --upgrade --trusted-host pypi.org pip incremental pywin32 buildbot[bundle] pyopenssl service_identity
        # this is why we ned to be admin:
        python sandbox/Scripts/pywin32_postinstall.py -install

        buildbot-worker create-worker . "${BUILDMASTER:?}" "${WINDOWS_NAME:?}" "${WINDOWS_PASS:?}"

        # service setup:
        # download and unzip nssm
        curl https://nssm.cc/ci/nssm-2.24-101-g897c7ad.zip -o nssm.zip
        archivepath=$(zipinfo -1 nssm.zip | grep exe | grep 64)
        unzip -p nssm.zip $archivepath > nssm.exe

        #install service
        ./nssm.exe install $servicename $DIR/buildbot-worker-start.cmd

        #modify username (keep ".\\"!) and password
        ./nssm.exe set $servicename ObjectName '.\\invalid-username' 'invalid-password'
        ./nssm.exe start $servicename
    else
        echo "you need to run this terminal as administrator"
        exit 1
    fi
else
    echo "Error. This script is intended for windows (mingw64)"
    exit 1
fi
