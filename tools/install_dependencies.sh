#!/usr/bin/env bash

set -e

sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
	echo "This is MacOS."
	brew install jq
	brew install gpg
	brew install md5sha1sum
elif [ $sysOS == "Linux" ];then
	echo "This is Linux."
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
    if [ $DISTRO == "Ubuntu" ];then
        echo "This is Ubuntu."
        sudo apt-get install jq
        sudo apt-get install gnupg
    fi
else
	echo "Other OS: $sysOS. Please manually install jq library."
fi
