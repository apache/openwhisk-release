#!/usr/bin/env bash

set -e

echo "Clean the remote artifacts in staging directory"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)
version_key="version"
version_major=$(json_by_key "$CONFIG" ${version_key}.major)
version_minor=$(json_by_key "$CONFIG" ${version_key}.minor)

version=$version_major-$version_minor
REMOTE_PATH="openwhisk-$version"
STAGE_URL=$(json_by_key "$CONFIG" "stage_url")
CURRENT_VERSION_URL="$STAGE_URL/${REMOTE_PATH}/"
CREDENTIALS=""

SVN_USERNAME=$1
SVN_PASSWORD=$2

if [ ! -z "$SVN_USERNAME" ] && [ ! -z "$SVN_PASSWORD" ];then
    CREDENTIALS="--username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive"
fi

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    svn delete $CURRENT_VERSION_URL -m "Removing Apache OpenWhisk release ${version} from staging." $CREDENTIALS
fi
