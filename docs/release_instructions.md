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

## Release Manager Initial Setup

If you have never served as a Release Manager (or it has been a while since you have done it), first read the [Release Manager Setup](release_manager_setup.md) instructions.

This repository includes scripts that automate many of the tasks a Release Manager must perform, but these scripts assume you have followed the instructions in the Release Manager Setup before you start executing them.

## Non-PMC Release Managers

Publishing a release is an official act of the OpenWhisk Project Management Committee (PMC).  If you are an OpenWhisk Committer, but not an OpenWhisk PMC member, you will need to pair-up with a PMC member to
accomplish some of the steps.

In brief, any step that adds or removes an artifact from a public distribution channel must be executed by an OpenWhisk PMC member.

## Background Information

If you are acting as a Release Manager, you should be familiar with the Apache Software Foundation's (ASF) [Release Creation Process](http://www.apache.org/dev/release-publishing.html) and [Release Policy](http://www.apache.org/legal/release-policy.html).

The detailed instructions and scripts we provide for Release Managers are designed to implement the ASF's policies and procedures in the specific context of the OpenWhisk project. However, it is still essential that each Release Manager understands the rationale underlying the steps they are executing.

### Licensing requirements

All released source code has to be compliant with Apache Licensing Policy. In part this is done by adding the LICENSE file and NOTICE file to each git repository and by adding Licensing headers to each source code file.  Please see [License Compliance] (license_compliance.md) for detailed information on Apache OpenWhisk project policies, rules and guidelines.

### Artifact requirements

Artifacts for project repository source code and any compiled binaries are packaged separately with each artifact being signed cryptographically.

### Release Approval

All Releases must be formally approved via a PMC vote on the dev list. A successful release vote must have a minimum of three positive binding votes and more positive than negative binding votes MUST be cast.

### Release distribution requirements

All release artifacts must be uploaded to project’s designated subdirectory in the Apache distribution channel ([https://dist.apache.org/repos/dist/](https://dist.apache.org/repos/dist/)).

Specifically, the Apache OpenWhisk project has a subdirectory to publish both candidate (staged) releases:

- [https://dist.apache.org/repos/dist/dev/openwhisk/](https://dist.apache.org/repos/dist/dev/openwhisk/)

and approved releases:
- [https://dist.apache.org/repos/dist/release/openwhisk/](https://dist.apache.org/repos/dist/release/openwhisk/).

Release announcements should not directly refer to the main Apache dist server for mirrored artifacts (the sources.tar.gz files). Instead they should refer to the OpenWhisk project download page:

- [https://apache.openwhisk.org/downloads](https://openwhisk.apache.org/downloads)

which is configured to redirect download requests to Apache dist mirrors or otherwise incorporate a mirroring enabled URL.

# Step-by-Step Instructions for the Release Process

### Preparing to Make a Release

Before creating release artifacts, the Release Manager should initiate a community discussion to confirm that we are ready to release the component(s). It is also good practice to do a quick check of the repositories to confirm they are release-ready to reduce the odds of needing multiple release candidates.

1. Start a [DISCUSS] thread on the dev list proposing the release.  Allow at least 24 hours for feedback.
1. Make sure all unit and integration tests are passing in the repositories that are being released. Check the [project status list](../README.md#project-status).
1. If a component being released includes a changelog or release notes file, make sure they are up-to-date.
1. If you are releasing either the `openwhisk` or `openwhisk-deploy-kube` repositories create a release branch in the Apache git repo.  Then submit a PR to that release branch to change all uses of the `nightly` tag to fixed tags (eg `1.14.0` or `8eb922f`).

### (Optional) Make a branch to create a Release

This step is only required when making a release for the `openwhisk` or `openwhisk-deploy-kube` repositories.

1. Create a Release branch with the version name in the upstream repository.

    >  **Important Note:** the release branch should be created in the upstream repository, *not a forked repository*.

    This branch would not be merged into the master branch and stay as a standalone branch.

    ```bash
    $ git checkout -b 1.0.0
    $ git push upstream 1.0.0
    ```

1. Add commits to this branch to make a Release.

    Sometimes, it is required to add a release specific commit. For example, the Docker image tag for runtimes should be updated to other than `nightly`.

    The Release Manager is supposed to open relevant PRs directly against the release branch and merge them.

1. Open a PR with the release branch.

    You can make sure the branch passes all CI tests whenever the branch changes.

1. Trigger the Jenkins job to build Docker images.

    Docker images built with the release version is required to run the standalone OpenWhisk without any local build.

    The following job is intended to build a release branch and publish images to the Docker hub.

    The Release Manager should update the branch specifier in the Jenkins job.

    - https://ci-builds.apache.org/job/OpenWhisk/job/OpenWhisk-DockerHub-ReleaseBranch/

    This job is supposed to be disabled after the release process is over.

### Defining the Release Contents

The contents of a release are defined by a JSON configuration file.

To create one for your release, make a copy of [config_template.json](../tools/config_template.json) and edit to provide the version information, list of repositories, and details for each repository.

After creating your config, commit it to [../release-configs](../release-configs) to provide historical documentation of project releases.

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
- For every repository in `RepoList`, we name-mangle it to convert `-` into `_` and use the mangled name as a key whose value is an object that defines:

  - `name`: User level name of the component
  - `hash`: git commit hash being released
  - `repository`: URL of the repository
  - `branch`: git branch being released (`master` or a release branch name)

> **Important Note 1:** If you are releasing a Node.js package which contains a `package.json`, you should make sure the `version` specified in `package.json` matches your release version. If you also have a `package-lock.json` file, it too must have a matching `version` property. See additional tips for [releasing npm packages](#publishing-to-npm).

> **Important Note 2:** If you are releasing the `openwhisk` or `openwhisk-deploy-kube` repositories, the branch and commit hash in the release contents should be the release branch and the latest commit hash in the  release branch. Please be careful not to use the `master` branch.

### Create Release Candidates

From the [tools directory](../tools), execute the script [build_release.sh](../tools/build_release.sh) providing the config.json file as an argument.

Using `../stagingArea` as scratch space, this script will clone the source repositories, package them into compressed tarballs, and create the checksum and detached PGP signature files.

```sh
$ cd tools
$ ./build_release.sh ../release-configs/<MY_RELEASE_CONFIG>.json [<MY_APACHE_GPG_KEY_ID>]
```

> **Important Note:** the `build_release.sh` script uses your system default GPG key to sign the release. To use an alternate key, specify the `MY_APACHE_GPG_KEY_ID` as a second argument. Omit this value to use the default key.

If successful, your release artifacts (i.e., `.tar.gz`,`tar.gz.asc`, and `.tar.gz.sha512`) should be in the `../stagingArea/artifacts` folder.

### Verify the release artifacts

Next, verify the release artifacts by running [local_verify.sh](../tools/local_verify.sh). This script will run `rcverify.sh` against your local artifacts.

```sh
./local_verify.sh ../release-configs/<MY_RELEASE_CONFIG>.json
```

> **TODO**:  In the future we would like to run the Apache Rat scanning tool (https://creadur.apache.org/rat/) as part of `local_verify.sh`.

For now, It is a recommended best practice to run the Apache Rat tool manually on each of your `.tar.gz` files.

Download RAT and invoke it on the `.tar.gz` file like:

```sh
java -jar apache-rat-0.13.jar stagingArea/artifacts/<release-name>.tar.gz
```

### Commit release artifacts to staging

If the release candidates pass all checks, commit them to the staging svn:

```sh
./upload_to_staging.sh ../release-configs/<MY_RELEASE_CONFIG>.json
```

You can verify the files were committed under the directory specified in your `<MY_RELEASE_CONFIG>.json` file's `pre_release_version` key's value (e.g., `rc1`) here:

- https://dist.apache.org/repos/dist/dev/openwhisk/

### Initiate a Release Vote

Initiate a release vote on the dev list.
Use the [gen-release-vote.py](../tools/gen-release-vote.py) script to create the body of the voting email.

```sh
./gen-release-vote.py ../release-configs/<MY_RELEASE_CONFIG>.json
```

This script accepts a [mailer configuration file](https://github.com/apache/openwhisk-release/blob/master/tools/mail-config-template.yaml) which you can use to also send the vote email directly to the mailing list. _You should dry run this command with `-n` to sanity check the vote notice before it is sent._

```sh
./gen-release-vote.py ../release-configs/<MY_RELEASE_CONFIG>.json -mc <MY_MAILER_CONFIG>.yaml
```

### Report Vote Result

When the vote can be closed (at least 72 hours and minimum number (3) of `+1` binding votes cast), the Release Manager will respond to the voting thread modifying the subject to start with `[RESULT][VOTE]...` announcing the result of the vote.

If the vote has sufficient `-1` votes cast, the Release Manager may declare that the vote has failed without waiting the full 72 hours.

If the vote is successful, the Release Manager proceeds with publishing the release and cleaning up as described below.

It the vote is unsuccessful, correct whatever issues were raised and restart the process with new candidate releases.  Update your `config.json` file by incrementing the `rc` number and changing git hashes.

### Publishing a Successful Release to Apache Dist Servers

> **Only a PMC member can perform this step**

After a successful vote, the release manager will commit the artifacts being released to the `openwhisk` subdir of the Apache dist svn.

The [`upload_to_dist.sh`](../tools/upload_to_dist.sh) script automates the copy & svn add operations, but it assumes that every file found in the release candidate subdir should be released.

If this is not true (e.g., multiple parallel release votes), then the upload must be performed manually.

```sh
./upload_to_dist.sh ../release-configs/<MY_RELEASE_CONFIG>.json
```

Assuming the expected set of files were added, commit them:

```sh
cd ../stagingArea/svn_release && svn commit -m  "Apache OpenWhisk X.Y.Z release of <Component Description>"
```

You can verify your commit to the Apache OpenWhisk official release folder:

- https://dist.apache.org/repos/dist/release/openwhisk/

Relatively soon after doing the svn commit, you should receive an email like the one shown below from reporter.apache.org asking you to add release data to its database information.

```text
Hi,
This is an automated email from reporter.apache.org.
I see that you just pushed something to our release repository for the 'openwhisk' project
in the following commit:

r35971 at 2019-09-23 16:07:53 +0000 (Mon, 23 Sep 2019)
Apache OpenWhisk CLI Group v1.0.0

If you are a PMC member of this project, we ask that you log on to:
<URL OMITTED>
and add your release data (version and date) to the database.

...omitted rest of email...
```

Please follow the link and perform the update; this information is quite useful for drafting our periodic reports to the ASF Board.

### Tag GitHub repositories

Each GitHub repository needs to be tagged.

> **Note** Some naming conventions for tagging vary across the OpenWhisk project repositories and therefore we have not yet attempted to automate this step.

For each released repository, the Release Manager should tag each released project using the same hash values specified in the release configuration file (i.e., `openwhisk-release/release-configs/<release config>.json`) and  approved by member email `[VOTE]`.

Open a terminal, go the home directory of the OpenWhisk project to be released and run the following commands:

```sh
git tag -s -a <tag> -m "OpenWhisk <project name> v<tag>" <commit hash>
git push <remote_url_var> <tag>
```

- [*Optional*] It is good practice to sign release tags using your GPG key by adding the `-s` flag which will use your system default key from your operating system keychain.
  - See [Signing tags using GPG keys](#signing-tags-using-gpg-keys) below.
- Replace `<tag>` with the tag name for the release of the current project (e.g., 1.1.0).
- Update the commit message, `-m` to reflect the project name and version which should match the release tag
- Replace `<commit hash>` with the commit hash (ID) you designated for the release of the current project. This can either be the full commit hash or the first 8 letters of the hash (to assure unique lookup).
- Replace `<remote_url_var>` to the remote repository label of the OpenWhisk project which is typically set to `upstream` for a project Committer and maps to the full GitHub URL (e.g., `git@github.com:apache/<project name>`)

### Signing tags using GPG keys

First [add your public GPG key to your GitHub Settings](https://docs.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key) and also [verify your key's associated `apache.org` email](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/adding-an-email-address-to-your-github-account). Then add it to your repository's local `git` configuration:

```sh
gpg --list-secret-keys --keyid-format LONG
git config user.signingkey <your GPG key ID>
```

Assure your repository's local `git` email is set to your `apache.org` email which matches your GPG key:

```sh
git config user.email <Apache username>@apache.org
```

You can verify your configuration by examining your local repository's `.git/config` file either manually or with:

```sh
git config --list
```

#### Deleting a tag

If a mistake is made, you can delete the undesired tags and start over:

```sh
git tag -d <tag>
```

Run the following command to remove a remote tag:

```sh
git push --delete <remote_url_var> <tag>
```

or try:

```sh
git push <remote_url_var> :refs/tags/<tag>
```

where `<remote_url_var>` is typically set to `upstream` for a project Committer.

> You can attempt to use the force `-f` flag if a normal `push` fails

#### Syncing release tags

If your fork's tags do not match those in the Apache project repository, you can sync them much like rebasing:

```sh
git fetch --tags upstream
git push -f --tags origin master
```

where `upstream` is the remote label for the Apache project repo. and `origin` is the remote label for your fork.

### Automated build of tagged binary release artifacts

Many of the GitHub repositories are configured to build binary artifacts in response to new tags being committed.  Monitor the build process and ensure that all expected artifacts are created for each tag you commit.

There are some slightly dated, but much more detailed comments on [Verifying release binaries](tag_release.md#verifying-release-binaries) available if you need a reminder of the git commands to use.

### Create GitHub releases

After pushing the tags, you should go to the GitHub Releases for each released project and "Draft a new release" using the tag you just pushed.

- If you have not already done so prior to voting on the release, update the project's `CHANGELOG` or `RELEASENOTES` to include the release versions, description and a list of all commits since the last release.
- Copy that same information information into the release description in GitHub.

### Dockerhub updates

> **Only a PMC member can push images to the openwhisk organization on Docker Hub**

If the components you released build docker images, then you should build the docker images locally, tag them with the release version (following the naming scheme for the repo).

Push the new images to the [openwhisk dockerhub](https://hub.docker.com/u/openwhisk) using the whiskbot dockerhub id, and update the `latest` tag to point to the new images.

### Rippling changes for `openwhisk-runtime-xxx` releases

If you are releasing a new version of an openwhisk runtime (e.g., `openwhisk-runtime-python`), then once the updated images are available on [dockerhub](https://hub.docker.com/u/openwhisk) you should submit a PR to openwhisk-deploy-kube to update the docker imageTags in that project's `helm/openwhisk/runtimes.json`.

If you released a new version of openwhisk-runtime-go, then you need to update tag information in the `Dockerfiles` of all actionloop based action runtimes.

To support reproducible builds, we always use a fixed-tag (and almost always a release tag) when pulling code from openwhisk-runtime-go into other runtime projects to build the actionloop go proxy.

The current list of "actionloop" based Dockerfiles is:

- openwhisk-runtime-java/core/java8actionloop/Dockerfile
- openwhisk-runtime-php/core/php7.3Action/Dockerfile
- openwhisk-runtime-php/core/php7.4Action/Dockerfile
- openwhisk-runtime-php/core/php8.0Action/Dockerfile
- openwhisk-runtime-python/core/python3ActionLoop/Dockerfile
- openwhisk-runtime-python/core/python3AiActionLoop/Dockerfile
- openwhisk-runtime-ruby/core/ruby2.6ActionLoop/Dockerfile
- openwhisk-runtime-rust/core/rust1.34/Dockerfile
- openwhisk-runtime-swift/core/swift42Action/Dockerfile
- openwhisk-runtime-swift/core/swift51Action/Dockerfile
- openwhisk-runtime-swift/core/swift53Action/Dockerfile

If you released a new version of `openwhisk-runtime-docker`, then you need to update tag information in the Dockerfiles of `openwhisk-runtime-python`.

To support reproducible builds, we always use a fixed-tag
(and almost always a release tag) when pulling code from `openwhisk-runtime-docker` into other runtime projects to build their images.

### Publishing to npm

> **Only a PMC member can publish to npm**

The `openwhisk-client-js`, `openwhisk-composer`, and `openwhisk-wskdebug` projects release npm packages built from each source release.  The Release Manager should build and publish these packages manually using the openwhisk-bot credentials found in the `npmjs.txt` file in the accounts subdir of the PMC private svn.

Some tips:

- Login as the openwhisk-bot using `npm login`.
- The `version` specified in `package.json` (and `package-lock.json`
if it exists) should match the release version. If they don't you need
to fix the release.
- Confirm that `npm pack` does not report any errors. Then delete the generated `.tgz` file.
- Confirm the list of files that will bundled using `npm publish --dry-run`.
- To publish the distribution, use `npm publish --public`.

If you are releasing a new version of the openwhisk-client-js package,
then after the new version of the `openwhisk` package is published on
npm, submit PRs to update the version number for the openwhisk package
in the package.json files found in the openwhisk, openwhisk-composer,
openwhisk-wskdebug, and openwhisk-runtime-nodejs git repos.  The command
`find . -name package.json -exec grep -l \"openwhisk\": {} \;`
can help you find all the places to change.

### Homebrew

If you released a new version of openwhisk-cli, then submit a PR to Homebrew to publish the new cli version.

### Helm Repository

If you released [openwhisk-deploy-kube](https://github.com/apache/openwhisk-deploy-kube/), you need to update the Helm repository we provide at https://openwhisk.apache.org/charts.

Perform the following steps:

1. On the release branch of openwhisk-deploy-kube, run `helm package helm/openwhisk`.
1. Add the resulting `openwhisk.tgz` to the GitHub release for openwhisk-deploy-kube
1. In [openwhisk-website](https://github.com/apache/openwhisk-website/), submit a PR to update [charts/index.yaml](https://github.com/apache/openwhisk-website/tree/master/charts) to include the new chart version.  This will take a little care, since `helm repo index`    defaults to assuming that the `.tgz` files are in the same directory as    the `index.yaml`, and we are hosting them elsewhere. Be sure to just add a stanza for the new release with a URL to the GitHub release download and to not    remove any of the existing stanzas for previous release.

### Update Downloads Page

Submit a PR to [openwhisk-website](https://github.com/apache/openwhisk-website) to update the Downloads page to
refer to the newly released versions.

### Announcing the Release

For all normal releases you should wait at least 24 hours before announcing the release to allow time for Apache Dist mirrors to be updated with the newly released artifacts.  You must also wait until the PR to update the website has been merged and the change appears on the website (successful Jenkins job to rebuild website).

When announcing a release, you must use the URL of the OpenWhisk Downloads page (or some other URL that supports mirroring).  Do not include a direct link to the dist.apache.org svn server.

- Releases should always be announced to `dev@openwhisk.apache.org`.
- Releases can optionally be announced to `announce@apache.org` at the discretion of the release manager.

### Post-release cleanup

1. Remove the release candidate files from the staging svn.

  for example, from the SVN `stagingArea/svn_staging/rc1` directory:

  ```sh
  $ svn delete openwhisk-<project>-<version>-sources.tar.gz
  D         openwhisk-<project>-<version>-sources.tar.gz
  $ svn delete openwhisk<project>-<version>-sources.tar.gz.asc
  D         openwhisk-<project>-<version>-sources.tar.gz.asc
  $ svn delete openwhisk-<project>-<version>-sources.tar.gz.sha512
  D         openwhisk-<project>-<version>-sources.tar.gz.sha512

  $ svn commit -m "Deleted file OpenWhisk <project> <version> staged files."

  ```

1. If there is a prior release, remove it from the release svn (all releases are automatically archived, removing an old release
from dist does not remove it from the archive).
1. Disable the Jenkins job to build and push Docker images to Docker hub if you released the `openwhisk` or `openwhisk-deploy-kube` repositories.
1. Close the PR for the release branch if you released the `openwhisk` or `openwhisk-deploy-kube` repositories.
