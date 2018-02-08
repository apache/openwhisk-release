#!/usr/bin/env bash

set -e

WORK_DIR=${1:-"$(dirname "$TRAVIS_BUILD_DIR")"}
OPENWHISK_SOURCE_DIR="$WORK_DIR/openwhisk_sources"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
PARENTDIR="$(dirname "$SCRIPTDIR")"

SVN_USERNAME=$2
SVN_PASSWORD=$3

"$PARENTDIR/install_dependencies.sh"
"$PARENTDIR/download_source_code.sh" $WORK_DIR

if [ "$TRAVIS_EVENT_TYPE" == "push" ] ; then
    "$PARENTDIR/clean_remote_artifacts.sh" $SVN_USERNAME $SVN_PASSWORD
fi

"$PARENTDIR/package_source_code.sh" $WORK_DIR $SVN_USERNAME $SVN_PASSWORD
"$PARENTDIR/generate_pgp_key.sh"
"$PARENTDIR/export_pgp_key.sh" $WORK_DIR
"$PARENTDIR/sign_artifacts.sh" $WORK_DIR

if [ "$TRAVIS_EVENT_TYPE" == "push" ] ; then
    "$PARENTDIR/upload_artifacts.sh" $WORK_DIR $SVN_USERNAME $SVN_PASSWORD
fi
