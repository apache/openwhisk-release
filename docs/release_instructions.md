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

# Instructions for Release Managers

## Background Information

If you are acting as a Release Manager, you should be familiar with
the Apache Software Foundation's (ASF)
[Release Creation Process](http://www.apache.org/dev/release-publishing.html) and
[Release Policy](http://www.apache.org/legal/release-policy.html).
The detailed instructions and scripts we provide for Release Managers
are designed to implement the ASF's policies and procedures in the
specific context of the OpenWhisk project. However, it is still
essential that each Release Manager understands the rationale underlying
the steps they are executing.

### Licensing requirements

All released source code has to be compliant with Apache Licensing
Policy. In part this is done by adding the LICENSE file and NOTICE file
to each git repository and by adding Licensing headers to each source code
file.  Please see [License Compliance](license_compliance.md) for
detailed information on Apache OpenWhisk project policies, rules and
guidelines.

### Artifact requirements

Artifacts for project repository source code and any compiled binaries
are packaged separately with each artifact being signed
cryptographically.

### Release Approval

All Releases must be formally approved via a PMC vote on the dev list.
A successful release vote must have a minimum of three positive binding
votes and more positive than negative binding votes MUST be cast.

### Release distribution requirements

All release artifacts must be uploaded to project’s designated subdirectory in the Apache distribution channel ([https://dist.apache.org/repos/dist/](https://dist.apache.org/repos/dist/)).

Specifically, the Apache OpenWhisk project has a subdirectory to publish both candidate (staged) releases:
[https://dist.apache.org/repos/dist/dev/openwhisk/](https://dist.apache.org/repos/dist/dev/openwhisk/)
and approved releases:
[https://dist.apache.org/repos/dist/release/openwhisk/](https://dist.apache.org/repos/dist/release/openwhisk/).

Release announcements should not directly refer to the main Apache dist server for mirrored artifacts (the sources.tar.gz files). Instead they should refer to the OpenWhisk project download page [https://apache.openwhisk.org/downloads](https://openwhisk.apache.org/downloads) which is configured to redirect download requests to Apache dist mirrors or otherwise incorporate a mirroring enabled URL.

# Step-by-Step Instructions for the Release Process

### Preparing to Make a Release

Before creating release artifacts, the Release Manager should initiate a community discussion to confirm that we are ready to release the component(s). It is also good practice to do a quick check of the repositories to confirm they are release-ready to reduce the odds of needing multiple release candidates.
  1. Start a [DISCUSS] thread on the dev list proposing the release.  Allow at least 24 hours for feedback.
  2. Make sure all unit and integration tests are passing in the repositories that are being released. Check the [project status list](../README.md#project-status).
  3. If a component being released includes a changelog or release notes file, make sure they are up-to-date.

### Defining the Release Contents

The contents of a release are defined by a JSON configuration file.
To create one for your release, make a copy of [config_template.json](../tools/config_template.json)
and edit to provide the version information, list of repositories, and details for each repository.
After creating your config, commit it to [../release-configs](../release-configs) to
provide historical documentation of project releases.

```
{
  "versioning": {
    "version": "X.Y.Z",
    "pre_release_version": "rc1"
  },
  "RepoList": [
    "openwhisk-repo-name-one",
    "openwhisk-repo-name-two"
  ],
  "openwhisk_repo_name_one": {
    "name": "OpenWhisk Repo Name",
    "hash": "<GIT COMMIT HASH>",
    "repository": "https://github.com/apache/openwhisk-<REPO-NAME-ONE>.git",
    "branch": "master"
  },
  "openwhisk_repo_name_two": {
    "name": "OpenWhisk Repo Two",
    "hash": "<GIT COMMIT HASH>",
    "repository": "https://github.com/apache/openwhisk-<REPO-NAME-TWO>.git",
    "branch": "master"
  }
}
```
  - **versioning**: Defines the release version and the release candidate number.
  - **RepoList**: Defines the list of OpenWhisk repositories being released.
  - For every repository in `RepoList`, we name-mangle it to convert `-` into `_` and use the
    mangled name as a key whose value is an object that defines
     - name: User level name of the component
     - hash: git commit hash being released
     - repository: URL of the repository
     - branch: git branch being released

### Create Release Candidates

From the [tools directory](../tools), execute the script
[build_release.sh](../tools/build_release.sh)
providing the config.json file as an argument.
Using ../stagingArea as scratch space, this script will clone the
source repositories, package them into compressed tarballs, and create
the checksum and detached PGP signature files.
```
./build_release.sh ../release-configs/<MY_RELEASE_CONFIG>.json
```

Next, verify the release artifacts by running [local_verify.sh](../tools/local_verify.sh). This
script will run rcverify.sh against your local artifacts.
```
./local_verify.sh ../release-configs/<MY_RELEASE_CONFIG>.json
```

TODO:  We should also run Apache Rat as part of local_verify.sh; for now it is
a recommended best practice to run Apache Rat by hand on each of your .tar.gz files.

If the release candidates pass all checks, commit them to the staging svn:
```
./upload_to_staging.sh ../release-configs/<MY_RELEASE_CONFIG>.json
```

### Initiate a Release Vote

Initiate a release vote on the dev list.
Use the [gen-release-vote.py](../tools/gen-release-vote.py)
script to create the body of the voting email.

### Report Vote Result

When the vote can be closed (at least 72 hours and minimum number of
binding votes cast), the Release Manager will respond to the voting
thread modifying the subject to start with `[RESULT][VOTE]...`
announcing the result of the vote. If the vote has sufficient -1 votes
cast, the Release Manager may declare that the vote has failed without
waiting the full 72 hours.

If the vote is successful, the Release Manager proceeds with
publishing the release and cleaning up as described below.

It the vote is unsuccessful, correct whatever issues were raised and
restart the process with new candidate releases.  Update your
`config.json` file by incrementing the `rc` number and changing git
hashes.

### Publishing a Successful Release

TODO: This portion of the documentation and scripting still needs to be updated.

  10. [Publish the release artifacts to Apache release directory](publish_apache_directory.md)
      You should receive an email from reporter.apache.org asking you to add your version data
      to its database shortly after you commit to the dist svn.  Please follow the link and
      add the information (this is useful for generating board reports).
  11. [Tag the commit IDs in the Github repository for the project](tag_release.md)
  12. [Generate the release notes](generate_release_notes.md)
  13. If appropriate, update dockerhub `latest` tags.
  14. If appropriate update deploy-kube and docker-compose tag info to pick up new images.
  15. Submit a PR to update the downloads page.

  20. Announce the release -- must wait until website PR is merged and Jenkins publishes site.
  30. Cleanup the artifacts from the release process:
      a. Remove the rc files from staging.
      b. Remove the previous If there is a previous released version, remove it from Apache release directory
         (it will automatically still be available via the Apache archive server).
