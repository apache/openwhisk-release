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

# Upload the public PGP key

The public PGP key file is named _KEYS_ available under the [release directory](https://dist.apache.org/repos/dist/release/openwhisk/). If you generate a new key to
sign the artifacts, you need to update the file of public key in the release directory for further use to verify the
artifacts. Checkout the [release directory](https://dist.apache.org/repos/dist/release/openwhisk/) via subversion,
modify the file KEYS by appending your local public key, and commit it back to the release directory. Please refer to the
[svn commands](http://svnbook.red-bean.com/en/1.7/svn.ref.html) to checkout, and commit.

You can export your public PGP key by running the following command:

```
$ pgp --export <key_id>
```

The parameter <key_id> can be either the key id or the email address you used to generate the key. For detailed information
on PGP keys, please visit [how to create and manage PGP keys](https://support.symantec.com/en_US/article.HOWTO41935.html).

## How to commit to the staging directory

Under the home directory of openwhisk release tool, you can find the local SVN directory openwhisk_release/