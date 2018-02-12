#!/usr/bin/env bash

set -e

echo "Import the PGP key."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"

# Load the public key located in the repo of openwhisk release.
echo "Load the public key."
gpg --import $SCRIPTDIR/key_pub.gpg

echo "Load the private key."
gpg --allow-secret-key-import --import $SCRIPTDIR/key_sec.gpg
