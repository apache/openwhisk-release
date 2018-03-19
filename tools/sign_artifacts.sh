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

echo "Sign the artifacts with PGP."

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
#source "$SCRIPTDIR/load_config.sh" $1 $2 $3
passphrase="openwhisk"

# Sign all the artifacts with the PGP key.
export GPG_TTY=$(tty)
sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
    # Request to enter the passphrase to cache.
    `gpg -o /dev/null --sign /dev/null`
fi

cd $CURRENT_VERSION_DIR
echo "Sign the artifacts with the private key."
for artifact in *.tar.gz; do
    gpg --print-md MD5 ${artifact} > ${artifact}.md5
    gpg --print-md SHA512 ${artifact} > ${artifact}.sha512

    if [ $sysOS == "Darwin" ];then
        # The option --passphrase-fd does not work on Mac.
        `gpg --yes --armor --output ${artifact}.asc --detach-sig ${artifact}`
    elif [ $sysOS == "Linux" ];then
        `echo $passphrase | gpg --passphrase-fd 0 --yes --armor --output ${artifact}.asc --detach-sig ${artifact}`
    fi
done

ls
