#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

CURRENTDIR="$(cd $(dirname "$0")/ && pwd)"
PARENTDIR="$(dirname "$CURRENTDIR")"

SVN_USERNAME=$1
SVN_PASSWORD=$2

"$PARENTDIR/install_dependencies.sh"

if [ ! -z "$TRAVIS_TAG" ] ; then
    # The git tag is named after the version to be released.
    release_version=$TRAVIS_TAG
    source "$PARENTDIR/load_config.sh" "$SVN_USERNAME" "$SVN_PASSWORD" "$PARENTDIR" "$release_version"
    "$PARENTDIR/move_stage_to_release.sh" "$SVN_USERNAME" "$SVN_PASSWORD"
else
    source "$PARENTDIR/load_config.sh" "$SVN_USERNAME" "$SVN_PASSWORD" "$PARENTDIR"
    "$PARENTDIR/download_source_code.sh"
    if [ "$TRAVIS_EVENT_TYPE" == "push" ] && [ "$PUBLISH_STAGE" == "true" ] ; then
        "$PARENTDIR/checkout_svn.sh" "$SVN_USERNAME" "$SVN_PASSWORD"
    fi

    "$PARENTDIR/package_source_code.sh"
    "$PARENTDIR/package_binaries.sh"

    if [ "$TRAVIS_EVENT_TYPE" == "push" ] && [ "$PUBLISH_STAGE" == "true" ] ; then
        "$CURRENTDIR/import_pgp_key.sh"
        "$PARENTDIR/sign_artifacts.sh"
        "$PARENTDIR/upload_artifacts.sh" "$SVN_USERNAME" "$SVN_PASSWORD"
    fi

    "$PARENTDIR/verify_source_code.sh"
fi
