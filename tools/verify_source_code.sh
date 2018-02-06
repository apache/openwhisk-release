#!/usr/bin/env bash

set -e

WORK_DIR=${1:-"$HOME"}
OPENWHISK_SOURCE_DIR="$WORK_DIR/openwhisk_sources"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"

# TODO: verify the source code headers
echo "TODO: verify the source code headers"
