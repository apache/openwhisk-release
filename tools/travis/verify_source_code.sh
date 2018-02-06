#!/usr/bin/env bash

set -e

WORK_DIR=${1:-"$(dirname "$TRAVIS_BUILD_DIR")"}
OPENWHISK_SOURCE_DIR="$WORK_DIR/openwhisk_sources"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
PARENTDIR="$(dirname "$SCRIPTDIR")"

echo $PARENTDIR
"$PARENTDIR/install_dependencies.sh"
"$PARENTDIR/download_source_code.sh" $WORK_DIR
"$PARENTDIR/verify_source_code.sh" $WORK_DIR

# TODO: verify the source code headers
echo "TODO: verify the source code headers"
