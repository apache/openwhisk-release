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
elif [ "$TRAVIS_EVENT_TYPE" == "push" ] ; then
    # For the Travis builds based on PRs, we only pick the necessary steps based on the flags PUBLISH_STAGE and UPDATE_DOC configured in config.json.
    source "$PARENTDIR/load_config.sh" "$SVN_USERNAME" "$SVN_PASSWORD" "$PARENTDIR"
    "$PARENTDIR/download_source_code.sh"
    "$PARENTDIR/checkout_svn.sh" "$SVN_USERNAME" "$SVN_PASSWORD"
    if [ "$PUBLISH_STAGE" == "true" ] ; then
        "$PARENTDIR/package_source_code.sh"
        if [ "$UPDATE_DOC" == "true" ] ; then
            "$PARENTDIR/package_doc.sh"
        fi
        "$PARENTDIR/package_binaries.sh"
        "$CURRENTDIR/import_pgp_key.sh"
        "$PARENTDIR/sign_artifacts.sh"
        "$PARENTDIR/upload_artifacts.sh" "$SVN_USERNAME" "$SVN_PASSWORD"
        "$PARENTDIR/verify_source_code.sh"
    elif [ "$UPDATE_DOC" == "true" ] ; then
        "$PARENTDIR/package_doc.sh"
        "$PARENTDIR/upload_artifacts.sh" "$SVN_USERNAME" "$SVN_PASSWORD"
        "$PARENTDIR/verify_source_code.sh"
    fi
elif [ "$TRAVIS_EVENT_TYPE" == "pull_request" ] ; then
    # For the Travis builds based on PRs, we need to verify all the steps, expect importing credentials, and uploading the artifacts.
    source "$PARENTDIR/load_config.sh" "$SVN_USERNAME" "$SVN_PASSWORD" "$PARENTDIR"
    "$PARENTDIR/download_source_code.sh"
    "$PARENTDIR/package_source_code.sh"
    "$PARENTDIR/package_doc.sh"
    "$PARENTDIR/package_binaries.sh"
    "$PARENTDIR/verify_source_code.sh"
fi
