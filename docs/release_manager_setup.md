<!--
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
-->

# Preparing to be a Release Mananger

## Platform and Prerequisites

Currently all Release Managers have either MacOS or Linux
workstations.  The scripting/automation assumes one of these two
platforms.

In addition to all the tools assumed to be installed for building
OpenWhisk, you will also need the following packages installed:
- svn
- jq
- expect
- gpg or gnupg

## Clone this repository

You may want to fork the repo and then clone your fork.  Setup to use
the same GitHub workflows you use for other OpenWhisk repositories to
which you contribute.

The scripts/automation in this project assume a local clone and
create/use working directories and staging areas within that clone.
Staging areas are listed in the `.gitignore` for the repository to
avoid accidential commits of generated artifacts.

## Get a local svn checkout of our distribution directories

The Apache distribution servers are managed by commiting/removing
files from project-specific directory trees in an svn repository.

You can run the script [tools/clone-dist-svns.sh](../tools/clone-dist-svns.sh)
to create a local checkout of these repositories at the path expected
by the rest of the scripts.


## Signing Keys 

All release artifacts are accompanied by cryptographic signatures
according to Apache release policy.

### Create a PGP key pair

You will need a PGP key pair. The key must have your
username@apache.org as one of its associated user ids.

See https://www.apache.org/dev/release-signing.html for the technical
requirements for your signing key and instructions on creating one if
you don't already have an acceptable one.

Currently ASF recommends using a 4096 bit RSA key to sign releases.

### Publish your public key to the project KEYS file.

Once you have your PGP key pair, append your public key to our
[KEYS file](https://dist.apache.org/repos/dist/release/openwhisk/KEYS)
in your local svn clone and commit the change.

*Our KEYS file is append only. Once a key has been used to sign a release it cannot be removed from the project's KEYS file.*

The commands to export your key (depending on your PGP client) can be found at the very top of the KEYS file,
and are also replicated below:
```
Developers: 
        pgp -kxa <your name> and append it to KEYS
        (pgpk -ll <your name> && pgpk -xa <your name>) >> KEYS.
        (gpg --list-sigs <your name>
             && gpg --armor --export <your name>) >> KEYS.
```


