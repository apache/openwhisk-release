#!/usr/bin/env bash

set -e

cd $TRAVIS_BUILD_DIR
./tools/travis/download_source_code.sh

# TODO: verify the source code headers
echo "TODO: verify the source code headers"
