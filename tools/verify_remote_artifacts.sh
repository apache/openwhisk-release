#!/usr/bin/env bash

set -e

echo "Verify the remote artifacts with the KEYS"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

mkdir -p $OPENWHISK_SVN
cd $OPENWHISK_SVN

# Remove the local folder, because we are about to download the artifacts from the staging folder.
rm -rf $REMOTE_PATH

# Check out the artifacts.
svn co $CURRENT_VERSION_URL $REMOTE_PATH

cd $REMOTE_PATH

import_key_verify_signature $OPENWHISK_SVN/$REMOTE_PATH
