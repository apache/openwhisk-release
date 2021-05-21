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

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
SCRIPTNAME=$(basename "$0")
GPG_KEY_ID=${GPG_KEY_ID:?Your GPG Key ID is required}

if [ $# -lt 1 ]; then
  echo "Usage: $SCRIPTNAME <config-file>"
  exit -1
fi

echo building release from configuration
./build_release.sh $1 $GPG_KEY_ID

echo verifying release candidate
./local_verify.sh $1

echo uploading release candidate to staging area
./upload_to_staging.sh $1

echo generating release candidate vote template
./gen-release-vote.py $1 -n
