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

# Preparing to be a Release Manager

## Platform and Prerequisites

Currently all Release Managers have either MacOS or Linux
workstations.  The scripting/automation assumes one of these two
platforms.

In addition to all the tools assumed to be installed for building OpenWhisk, you will also need the following packages installed:

- [Subversion](https://subversion.apache.org/packages.html) (svn) - client for Apache's source code management system
- [GnuPG](https://www.gnupg.org/) (gpg) *or an OpenPGP-compatible equivalent* - for generating and managing signing keys and sign release artifacts
- [jq](https://stedolan.github.io/jq/) (jq) - a lightweight JSON processor
- [expect](https://en.wikipedia.org/wiki/Expect) - automates release scripts that expect user input

## Clone this repository

You will need to fork this `openwhisk-release` repository and then clone your fork.  Setup to use the same GitHub workflows you use for other OpenWhisk repositories to which you contribute.

The scripts/automation in this project assume a local clone and create/use working directories and staging areas within that clone.

> Note: Staging areas are listed in the `.gitignore` for the repository to avoid accidental commits of generated artifacts.

## Get a local svn checkout of our distribution directories

The Apache distribution servers are managed by committing/removing files from project-specific directory trees in an svn repository.

You can run the script [tools/checkout_svn.sh](../tools/checkout_svn.sh) to create a local checkout of these repositories at the path expected by the rest of the scripts.

For example, run the script from within the root of your local clone of the `openwhisk-release` repository:

```sh
$ ./tools/checkout_svn.sh

Checkout staging and release SVN to the working directory.
Checked out revision 46582.
A    stagingArea/svn_staging/rc1
A    stagingArea/svn_release/20.11
A    stagingArea/svn_release/20.11/openwhisk-package-alarms-2.2.0-sources.tar.gz
A    stagingArea/svn_release/openwhisk-runtime-php-1.16.0-sources.tar.gz
A    stagingArea/svn_release/openwhisk-runtime-php-1.16.0-sources.tar.gz.asc
...
```

## Signing Keys

All release artifacts are accompanied by cryptographic signatures according to Apache release policy.

The ASF requires you to use a PGP key pair that:

- uses the `RSA` algorithm,
- has your `username@apache.org` email address as one of its associated identifiers,
- `does not expire` and
- has the recommended key length of `4096` bits.

See https://www.apache.org/dev/release-signing.html for a full explanation and list of technical requirements.

### Create a PGP key pair

#### GPG Example

The following command will prompt you for to supply all the values needed by the ASF and override defaults:

```sh
$ gpg --full-gen-key
```

> Note: You do not need to supply a `comment` as part of the signature.

### Publish your public key to the project KEYS file

The KEYS file is a plain-text file containing the public key signatures of the release managers (and optionally other committers) for the project.

Each signature in the KEYS file is comprised of the key's signature followed by the ASCII-armored, exported copy of it.

> **Only a PMC member can commit changes to the KEYS file**

Once you have your PGP key pair, append your public key to our [KEYS file](https://dist.apache.org/repos/dist/release/openwhisk/KEYS) in your local svn clone and commit the change.

> **The KEYS file is append only. Once a key has been used to sign a release it cannot be removed from the KEYS file.**

The commands to export your key and append it (depending on your PGP client) can be found at the very top of the [`KEYS`](https://dist.apache.org/repos/dist/release/openwhisk/KEYS) file itself, and are also replicated below:

> **Steps for PMC member to amend KEYS file**
  ```
  # checkout svn repo if necessary
  ./tools/checkout_svn.sh

  # amend KEYS file./stagingArea/svn_release/KEYS
  cd ./stagingArea/svn_release
  vi KEYS # or whatever editor you prefer

  # sanity check your changes
  svn diff

  # commit
  svn commit KEYS
  ```

#### GPG Example (recommended)

Apache recommends [GNU Privacy Guard (GnuPG)](https://www.gnupg.org/), an open-source, OpenPGP compatible implementation.

You can show your key's signature with this command:

```sh
$ gpg --list-sigs <your name>
```

where `<your name>` is the one entered when generating the key.

In order to submit your public key to a public key server, you first have to produce an ASCII-armored copy of it:

```sh
$ gpg --armor --export <your name>
```

Append both your key's signature and ASCII-armored public key to the KEYS file:

```sh
(gpg --list-sigs <your name> && gpg --armor --export <your name>) >> KEYS
```

> *In recent releases of GnuPG, the `gpg` and `gpg2` commands utilize the same code and should be viewed as equivalent in any legacy instructions.*

#### PGPK Example

You can show your key's fingerprint (i.e., signature) with this command:

```sh
$ pgpk -ll
```

In order to submit your public key to a public key server, you first have to produce an ASCII-armored copy of it:

```sh
pgpk -xa smith
```

Append both your key's fingerprint and ASCII-armored public key to the KEYS file:

```sh
(pgpk -ll <your name> && pgpk -xa <your name>) >> KEYS
```

#### PGP Example

```sh
pgp -kxa <your name> # and append it to KEYS file manually
```
