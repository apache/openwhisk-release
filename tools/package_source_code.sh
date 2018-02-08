#!/usr/bin/env bash

set -e

echo "Package the artifacts."

SVN_USERNAME=$2
SVN_PASSWORD=$3
CREDENTIALS=""

if [ ! -z "$SVN_USERNAME" ] && [ ! -z "$SVN_PASSWORD" ];then
    CREDENTIALS="--username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive"
fi

WORK_DIR=${1:-"$HOME"}

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
echo $version

STAGE_URL=$(json_by_key "$CONFIG" "stage_url")
echo $STAGE_URL

# Create a subversion directory for openwhisk to stage all the packages
rm -rf $OPENWHISK_SVN

mkdir -p $OPENWHISK_SOURCE_DIR
cd $OPENWHISK_SOURCE_DIR
svn co $STAGE_URL $OPENWHISK_SVN $CREDENTIALS
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

