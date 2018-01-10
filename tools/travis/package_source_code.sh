#!/usr/bin/env bash

set -e

cd $TRAVIS_BUILD_DIR
./tools/travis/download_source_code.sh

# TODO: add release note and license file if necessary
echo "add release note and license file if necessary"

# TODO: package all the source code and upload them into the designated directory
