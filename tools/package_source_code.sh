#!/usr/bin/env bash

set -e

echo "Package the artifacts."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

# Create a subversion directory for openwhisk to stage all the packages
rm -rf $OPENWHISK_SVN
mkdir -p $CURRENT_VERSION_DIR
rm -rf $CURRENT_VERSION_DIR/*

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    echo $repo_name
    if [ $repo_name != "incubator-openwhisk" ]; then
    # Only wskdeploy has both the gradle tasks implemented: cleanBuild to clean the build folder, and taredSources
    # to package the source code.
        cd $OPENWHISK_SOURCE_DIR/$repo_name
        ./gradlew cleanBuild
        ./gradlew taredSources -PprojectVersion=$version
        # Copy all the source code packages into $CURRENT_VERSION_DIR
        cp -a build/. $CURRENT_VERSION_DIR
    fi
done
