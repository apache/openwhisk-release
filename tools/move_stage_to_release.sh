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

echo "Move the remote artifacts from staging to release directory."

echo "THIS SCRIPT NEEDS TO BE UPDATED"

exit 1

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"

source "$SCRIPTDIR/load_config.sh"

if [[ `wget -S --spider $RELEASE_VERSION_URL  2>&1 | grep 'HTTP/1.1 404 Not Found'` ]]; then
    svn mkdir $RELEASE_VERSION_URL -m "Creating Apache OpenWhisk release ${version}."
fi

# Create a subversion directory for openwhisk to stage all the packages
rm -rf $OPENWHISK_SVN
mkdir -p $OPENWHISK_SVN
cd $OPENWHISK_SVN

# Check out the artifacts in the staging URL to a local directory.
svn co $CURRENT_VERSION_URL $REMOTE_PATH

# Check out the release directory to a local directory.
svn co $RELEASE_VERSION_URL $REMOTE_PATH_RELEASE

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    cp ${REMOTE_PATH}/${repo_name}-${version}-sources.tar.gz* ${REMOTE_PATH_RELEASE}/
done

cd $REMOTE_PATH_RELEASE
svn add --force *
svn commit -m "Updating Apache OpenWhisk release ${version}."
