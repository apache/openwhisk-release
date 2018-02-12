#!/usr/bin/env bash

WORK_DIR=${1:-"$HOME"}
SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"

SVN_USERNAME=$2
SVN_PASSWORD=$3
CREDENTIALS=""

if [ ! -z "$SVN_USERNAME" ] && [ ! -z "$SVN_PASSWORD" ];then
    CREDENTIALS="--username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive"
fi

OPENWHISK_SOURCE_DIR="$WORK_DIR/openwhisk_sources"
OPENWHISK_SVN="$OPENWHISK_SOURCE_DIR/openwhisk"

source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)
repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')
STAGE_URL=$(json_by_key "$CONFIG" "stage_url")

version_key="version"
version_major=$(json_by_key "$CONFIG" ${version_key}.major)
version_minor=$(json_by_key "$CONFIG" ${version_key}.minor)

version=$version_major-$version_minor
REMOTE_PATH="openwhisk-$version"

CURRENT_VERSION_URL="$STAGE_URL/${REMOTE_PATH}/"
CURRENT_VERSION_DIR="$OPENWHISK_SVN/openwhisk-$version"
