#!/usr/bin/env bash

set -e

echo "Verify the local artifacts with the KEYS"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

cd $OPENWHISK_SVN/$REMOTE_PATH

import_key_verify_signature $STAGE_URL/KEYS
