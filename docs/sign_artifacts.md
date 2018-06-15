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

# Sign the artifacts

Each package needs to be accompanied by cryptographic signatures according to Apache release policy.

## Generate the PGP key pair

You can either follow the [online PGP instruction](https://support.symantec.com/en_US/article.HOWTO41935.html) to generate the PGP key for your environment, or use our script to
generate for you. First, you need to config [_pgp_key_gen.conf_](../tools/pgp_key_gen.conf) under the folder _tools_. Make sure you have the proper
Name-Real, Name-Comment, Name-Email, and Passphrase for your key. You do not need to change Key-Type, Key-Length, and
Expire-Date. Run the following script under the folder _tools_:

```
$ ./generate_pgp_key.sh
```

The configuration to generate PGP key pair needs to be associated with an identity. We use the following fields to define the identity:

* **Name-Real:** the field to specify the name of the key with the default value OpenWhisk Release Bot.
* **Name-Comment:** the field to specify the description of the key.
* **Name-Email:** the field to specify the email address of the key.
* **Passphrase:** the field to specify the passphrase of the key.
* **Key-Type:** the field to specify the type of the key. The default value is RSA.
* **Key-Length:** the field to specify the length of the key. The default value is 4096.
* **Expire-Date:** the field to specify the expiration date of the key. The default value is 0, meaning the key will never expire.

## Sign the artifacts:

All the artifacts can be signed by running the following script under _tools_:

```
$ ./sign_artifacts.sh <SVN_USERNAME> <SVN_PASSWORD>
```
                      
If you have configured your local SVN with the username and the password, you can run the above script without the parameters.

This script generates a file of the MD5 checksum suffixed with .md5, a file of the SHA512 checksum suffixed with .sha512, and a signature file suffixed with .asc for each package.
