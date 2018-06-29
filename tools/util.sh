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

function read_file() {
    cat $1
}

function json_by_key() {
    input=$1
    key=$2
    echo $input | jq ''.$key'' | sed -e 's/^"//' -e 's/"$//'
}

function import_key_verify_signature() {
    key_url=$1
    echo "Importing PGP keys"
    curl $key_url | gpg --import && \
    echo "[✓] GPG keys imported" \
      || { echo "[x] Failed to import GPG keys"; exit 1; }

    echo "Checking signatures and hashes of artifacts"
    for artifact in $(find * -type f \( -name '*.tar.gz' \) ); do
        # Check sha512
        artifactSha512=$(gpg --print-md SHA512 ${artifact})
        artifactSha512File=$(cat ${artifact}.sha512)
        if [ "$artifactSha512" == "$artifactSha512File" ];then
            echo "[✓] SHA512 verified for $artifact"
        else
            echo "[x] Unmatched SHA512 for $artifact."; exit 1;
        fi

        # Verify the signatures
        gpg --verify ${artifact}.asc ${artifact} && \
        echo "[✓] Signatures verified for $artifact" \
          || { echo "[x] Invalid signature for $artifact."; exit 1; }
    done
}
