#!/usr/bin/env bash

set -e

echo "Export the PGP key."

WORK_DIR=${1:-"$HOME"}
PGP_EMAIL=${2:-"shou@us.ibm.com"}
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

cd $CURRENT_VERSION_DIR

# Output the public key into the file KEYS to be uploaded into the staging directory.
gpg --yes --output KEYS --armor --export $PGP_EMAIL
