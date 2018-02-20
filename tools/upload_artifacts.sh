#!/usr/bin/env bash

set -e

echo "Upload the artifacts."

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    svn delete $CURRENT_VERSION_URL -m "Removing Apache OpenWhisk release ${version} from staging." $CREDENTIALS
fi

# Create an empty folder named ${REMOTE_PATH} in the remote staging folder
svn mkdir -m "Create the directory for ${version} in staging." $CURRENT_VERSION_URL $CREDENTIALS

cd $OPENWHISK_SVN

# Make sure the folder $REMOTE_PATH is connected to the svn staging server.
svn co $CURRENT_VERSION_URL $REMOTE_PATH

cd $REMOTE_PATH

svn add --force * $CREDENTIALS
svn commit -m "Staging Apache OpenWhisk release ${version}." $CREDENTIALS

# Disconnect $REMOTE_PATH with the remote staging server.
rm -rf .svn
