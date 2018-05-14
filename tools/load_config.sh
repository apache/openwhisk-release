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

WORK_DIR=${1:-"$HOME"}
DIR="$(cd $(dirname "$0")/ && pwd)"
SVN_USERNAME=$2
SVN_PASSWORD=$3
SCRIPTDIR=${4:-"$DIR"}
CREDENTIALS=""

if [ ! -z "$SVN_USERNAME" ] && [ ! -z "$SVN_PASSWORD" ];then
    CREDENTIALS="--username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive"
fi

OPENWHISK_RELEASE_DIR="$WORK_DIR/openwhisk_release"
OPENWHISK_SOURCE_DIR="$OPENWHISK_RELEASE_DIR/openwhisk_sources"
OPENWHISK_CLEANED_SOURCE_DIR="$OPENWHISK_RELEASE_DIR/openwhisk_cleaned_sources"
OPENWHISK_SVN="$OPENWHISK_RELEASE_DIR/openwhisk"

source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)
PUBLISH_STAGE=$(json_by_key "$CONFIG" "publish_stage")
repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')
STAGE_URL=$(json_by_key "$CONFIG" "stage_url")
RELEASE_URL=$(json_by_key "$CONFIG" "release_url")

version_key="versioning"
version_json=$(json_by_key "$CONFIG" ${version_key}.version)
version=${5:-"$version_json"}
pre_release_version=$(json_by_key "$CONFIG" ${version_key}.pre_release_version)
full_version=$version_json

if [ ! -z "$pre_release_version" ]; then
    pre_release_version_no_space="$(echo -e "${pre_release_version}" | tr -d '[[:space:]]')"
    if [ ! -z "$pre_release_version_no_space" ]; then
        full_version=$full_version-$pre_release_version_no_space
    fi
fi

REMOTE_PATH="openwhisk-$full_version"
REMOTE_PATH_RELEASE="openwhisk-$version"

CURRENT_VERSION_URL="$STAGE_URL/${REMOTE_PATH}/"
CURRENT_VERSION_DIR="$OPENWHISK_SVN/$REMOTE_PATH"

RELEASE_VERSION_URL_STAGE="$RELEASE_URL/${REMOTE_PATH}/"
RELEASE_VERSION_URL="$RELEASE_URL/${REMOTE_PATH_RELEASE}/"
