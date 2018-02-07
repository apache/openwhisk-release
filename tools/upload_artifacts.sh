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
version_key="version"
version_major=$(json_by_key "$CONFIG" ${version_key}.major)
version_minor=$(json_by_key "$CONFIG" ${version_key}.minor)

version=$version_major-$version_minor
CURRENT_VERSION_DIR="$OPENWHISK_SVN/openwhisk-$version"

cd $OPENWHISK_SVN
svn add --force "openwhisk-$version" $CREDENTIALS
svn commit -m "Staging Apache OpenWhisk release ${version}." $CREDENTIALS
