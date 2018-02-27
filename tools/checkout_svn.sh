#!/usr/bin/env bash

set -e

echo "Checkout the SVN to the local directory."

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 404 Not Found'` ]]; then
    # Create an empty folder named ${REMOTE_PATH} in the remote staging folder
    svn mkdir -m "Create the directory for ${version} in staging." $CURRENT_VERSION_URL $CREDENTIALS
fi

# Create a subversion directory for openwhisk to stage all the packages
rm -rf $OPENWHISK_SVN
mkdir -p $OPENWHISK_SVN
rm -rf $OPENWHISK_SVN/*

cd $OPENWHISK_SVN

# Make sure the folder $REMOTE_PATH is connected to the svn staging server.
svn co $CURRENT_VERSION_URL $REMOTE_PATH
