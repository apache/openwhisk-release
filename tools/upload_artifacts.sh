#!/usr/bin/env bash

set -e

echo "Upload the artifacts."

WORK_DIR=${1:-"$HOME"}

SVN_USERNAME=$2
SVN_PASSWORD=$3
CREDENTIALS=""

if [ ! -z "$SVN_USERNAME" ] && [ ! -z "$SVN_PASSWORD" ];then
    CREDENTIALS="--username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive"
fi

OPENWHISK_SOURCE_DIR="$WORK_DIR/openwhisk_sources"
OPENWHISK_SVN="$OPENWHISK_SOURCE_DIR/openwhisk"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)
STAGE_URL=$(json_by_key "$CONFIG" "stage_url")

version_key="version"
version_major=$(json_by_key "$CONFIG" ${version_key}.major)
version_minor=$(json_by_key "$CONFIG" ${version_key}.minor)

version=$version_major-$version_minor
REMOTE_PATH="openwhisk-$version"

CURRENT_VERSION_URL="$STAGE_URL/${REMOTE_PATH}/"

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    svn delete $CURRENT_VERSION_URL -m "Removing Apache OpenWhisk release ${version} from staging." $CREDENTIALS
fi

# Create an empty folder named ${REMOTE_PATH} in the remote staging folder
svn mkdir -m "Create the directory for ${version} in staging." $CURRENT_VERSION_URL

cd $OPENWHISK_SVN

# Make sure the folder $REMOTE_PATH is connected to the svn staging server.
svn co $CURRENT_VERSION_URL $REMOTE_PATH

cd $REMOTE_PATH

svn add --force * $CREDENTIALS
svn commit -m "Staging Apache OpenWhisk release ${version}." $CREDENTIALS

# Disconnect $REMOTE_PATH with the remote staging server.
rm -rf .svn
