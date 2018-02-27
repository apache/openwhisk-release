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

echo "hello openwhisk release"

# Define the parent directory of TRAVIS_BUILD_DIR(the directory of the current repository) as HOMEDIR
WORK_DIR=${1:-"$(dirname "$TRAVIS_BUILD_DIR")"}
OPENWHISKDIR="$WORK_DIR/openwhisk_sources"
SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
PARENTDIR="$(dirname "$SCRIPTDIR")"

SUFFIX="$TRAVIS_BUILD_NUMBER"
PR_NUM="$TRAVIS_PULL_REQUEST"
PREFIX="build_testing"

export OPENWHISK_HOME="$OPENWHISKDIR/incubator-openwhisk";

mkdir -p $OPENWHISKDIR
cd $OPENWHISKDIR

echo "list images in setup before build"
docker images

"$PARENTDIR/download_source_code.sh" $WORK_DIR

cd $OPENWHISKDIR/incubator-openwhisk
./tools/travis/setup.sh
TERM=dumb ./gradlew core:controller:distDocker core:invoker:distDocker -PdockerImagePrefix=$PREFIX

cd ansible
ANSIBLE_CMD="ansible-playbook -i environments/local -e docker_image_prefix=$PREFIX"
$ANSIBLE_CMD setup.yml
$ANSIBLE_CMD prereq.yml
$ANSIBLE_CMD couchdb.yml
$ANSIBLE_CMD initdb.yml
$ANSIBLE_CMD apigateway.yml
$ANSIBLE_CMD wipe.yml
$ANSIBLE_CMD openwhisk.yml

# Build the binaries for CLI
cd $OPENWHISKDIR/incubator-openwhisk-cli
#./gradlew buildBinaries -PcrossCompileCLI=true

# Build the binaries for wskdeploy
cd $OPENWHISKDIR/incubator-openwhisk-wskdeploy
#./gradlew distDocker -PcrossCompileWSKDEPLOY=true
