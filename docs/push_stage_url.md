<!--
#
# Licensed to the Apache Software Foundation (ASF) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.  The ASF licenses this file to you
# under the Apache License, Version 2.0 (the # "License"); you may not use this
# file except in compliance with the License.  You may obtain a copy of the License
# at:
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
-->

# Publish the release artifacts to the staging directory

After the artifacts are generated and signed, you can run the following script under the folder _tools_, to upload them
into the staging directory:

```
$ ./upload_artifacts.sh <WORK_DIR>
```

The <WORK_DIR> should be the same one used to download the source code. This script will create a remote directory named
openwhisk-\<version\>-\<pre_release_version\> under the staging directory, and push all the files available locally under openwhisk-\<version\>-\<pre_release_version\>
upstream. It will overwrite the old files or directories, if the directory openwhisk-\<version\>-\<pre_release_version\> is available as a svn folder.
