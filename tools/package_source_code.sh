#!/usr/bin/env bash

set -e

echo "Package the artifacts."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

# Clean up all the source code by excluding unnecessary files and folders
# Remove all the hidden files and folder
# Remove bin and build folders
mkdir -p $OPENWHISK_CLEANED_SOURCE_DIR
rm -rf $OPENWHISK_CLEANED_SOURCE_DIR/*
rsync -rtp --exclude .*\* --exclude bin\* --exclude build\* $OPENWHISK_SOURCE_DIR/. $OPENWHISK_CLEANED_SOURCE_DIR

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    cd $OPENWHISK_CLEANED_SOURCE_DIR/$repo_name && tar czf ${CURRENT_VERSION_DIR}/${repo_name}-${version}-sources.tar.gz .
done
