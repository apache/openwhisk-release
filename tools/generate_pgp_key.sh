#!/usr/bin/env bash

set -e

echo "Generate the PGP key."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
echo abc | gpg --passphrase-fd 0 --batch --gen-key "$SCRIPTDIR/pgp_key_gen.conf"
