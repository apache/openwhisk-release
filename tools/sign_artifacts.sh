#!/usr/bin/env bash

set -e

echo "Sign the artifacts with PGP."

WORK_DIR=${1:-"$HOME"}
passphrase=${2:-"openwhisk"}

OPENWHISK_SOURCE_DIR="$WORK_DIR/openwhisk_sources"
OPENWHISK_SVN="$OPENWHISK_SOURCE_DIR/openwhisk"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)
repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')
version_key="version"
version_major=$(json_by_key "$CONFIG" ${version_key}.major)
version_minor=$(json_by_key "$CONFIG" ${version_key}.minor)

version=$version_major-$version_minor
CURRENT_VERSION_DIR="$OPENWHISK_SVN/openwhisk-$version"

# Sign all the artifacts with the PGP key.
export GPG_TTY=$(tty)
sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
    # Request to enter the passphrase to cache.
    `gpg -o /dev/null --sign /dev/null`
fi

cd $CURRENT_VERSION_DIR
echo "Sign the artifacts with the private key."
for artifact in *.tar.gz; do
    gpg --print-md MD5 ${artifact} > ${artifact}.md5
    gpg --print-md SHA512 ${artifact} > ${artifact}.sha512

    if [ $sysOS == "Darwin" ];then
        # The option --passphrase-fd does not work on Mac.
        `gpg --yes --armor --output ${artifact}.asc --detach-sig ${artifact}`
    elif [ $sysOS == "Linux" ];then
        echo "started to sign it"
        `echo $passphrase | gpg -c -q --passphrase-fd 0 --yes --armor --output ${artifact}.asc --detach-sig ${artifact}`
    fi
done

ls
