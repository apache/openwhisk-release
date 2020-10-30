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

# Building an Apache OpenWhisk release from source

## Restore the Gradle Wrapper Jar

Most of the Apache OpenWhisk components use the [Gradle](https://gradle.org)
build tool.  As described in more detail in the
[Gradle Wrapper documentation](https://docs.gradle.org/current/userguide/gradle_wrapper.html),
Gradle is designed to securely bootstrap itself from a small jar file
which is normally located in each OpenWhisk source tree at
`gradle/wrapper/gradle-wrapper.jar`.

However, including the binary `gradle-wrapper.jar` is not allowed in
Apache source releases.  Therefore, if after unpacking an OpenWhisk
source release you see a `build.gradle` at the top level of the source tree
you will have to restore the missing jar file before you can build anything.

If you have a compatible version of `gradle` already installed on your
machine, this can be done by performing the following steps.

1. Inspect `gradle/wrapper/gradle-wrapper.properties` to determine the expected version of gradle. Look for
the version number embedded in the distributionUrl property.
2. Execute the command `gradle wrapper --gradle-version X.Y.Z` replacing X.Y.Z with the version number from `gradle-wrapper.properties`.

If this command succeeds, you should now be able to execute `./gradlew` to download the right version of
gradle and build OpenWhisk. Consult the README.md for component-specific detailed instructions, such as the build target.

The command may fail because your version of gradle is incompatible
with the build.gradle files included in the project.  If this happens,
you can either (a) install the matching version of gradle or (b)
execute the `gradle wrapper --gradle-version X.Y.Z` command in a
scratch directory and then manually copy `gradle-wrapper.jar` to
`gradle/wrapper`.
