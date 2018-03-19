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
echo "4 is $4"
CREDENTIALS=""

if [ ! -z "$SVN_USERNAME" ] && [ ! -z "$SVN_PASSWORD" ];then
    CREDENTIALS="--username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive"
fi

OPENWHISK_RELEASE_DIR="$WORK_DIR/openwhisk_release"
OPENWHISK_SOURCE_DIR="$OPENWHISK_RELEASE_DIR/openwhisk_sources"
OPENWHISK_CLEANED_SOURCE_DIR="$OPENWHISK_RELEASE_DIR/openwhisk_cleaned_sources"
OPENWHISK_SVN="$OPENWHISK_RELEASE_DIR/openwhisk"

echo "SCRIPTDIR is $SCRIPTDIR"
source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)
repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')
STAGE_URL=$(json_by_key "$CONFIG" "stage_url")

version_key="version"
version_major=$(json_by_key "$CONFIG" ${version_key}.major)
version_minor=$(json_by_key "$CONFIG" ${version_key}.minor)

version=$version_major-$version_minor
REMOTE_PATH="openwhisk-$version"

CURRENT_VERSION_URL="$STAGE_URL/${REMOTE_PATH}/"
CURRENT_VERSION_DIR="$OPENWHISK_SVN/openwhisk-$version"

CONFIG_LOADED="true"
