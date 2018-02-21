#!/usr/bin/env bash

set -e

echo "Upload the artifacts."

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

cd $OPENWHISK_SVN/$REMOTE_PATH

svn add --force * $CREDENTIALS
svn commit -m "Staging Apache OpenWhisk release ${version}." $CREDENTIALS

# Disconnect $REMOTE_PATH with the remote staging server.
rm -rf .svn
