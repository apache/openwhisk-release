# General plan to implement the Apache release process for OpenWhisk

The purpose of this repository is to provide a one-stop entry tool to manage the release process of OpenWhisk in an automated
way. 1,000 people will probably have 1,000 ideas about how to fulfill it, since we are living in such an innovative world.
We believe they are all the valid routes, directing to our final destination, as long as they are compliant with the Apache
release process. This specification just gives us one proposal, which may not be perfect, but will be proven to be capable of
leading OpenWhisk team to the paradise, the release of shipped, packaged, Apache-compliant, able-to-run OpenWhisk source
code and compiled artifacts.

Long story short, Apache generally needs two type of packages to be publicly available after the declaration of the release:
source code and the compiled artifacts. We would like to divide the work into two major phases: release of source code and
release of compiled artifacts.

## Release of OpenWhisk artifacts

Please click on the work items listed as belows to access the detailed information:
- [1. Download the source code](work_items.md#1-download-the-source-code-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/16))
- [2. Verify the compliance of the source code](work_items.md#2-verify-the-compliance-of-the-source-code-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/17))
- [3. Deploy OpenWhisk based on the source code](work_items.md#3-deploy-openwhisk-based-on-the-source-code-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/18))
- [4. Test each OpenWhisk component](work_items.md#4-test-each-openwhisk-component-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/19))
- [5. Add NOTICE, LICENSE, and CHANGELOG to each OpenWhisk project](work_items.md#5-add-notice-license-and-changelog-to-each-openwhisk-project-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/13))
- [6. Package the artifacts](work_items.md#6-package-the-artifacts-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/20))
- [7. Upload the artifacts to staging repository](work_items.md#7-upload-the-artifacts-into-staging-repository-for-release-vote-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/21))
    - After the above 7 steps, note will be sent out to the community for vote. Before we reach enough votes, Step 1 to 7
    can be re-iterated to update the artifacts in staging repository.

- [8. Release the artifacts](work_items.md#8-release-the-artifacts-open-issue) ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/22))

## Different phases of implementations

We plan to implement the specification in three phases:
- **Phase 1: release of source code packages**: the source code of each OpenWhisk repositories is packaged into tar.gz
file, and uploaded into the staging repository. This is the phase we are currently working on.
- **Phase 2: release of binary packages**: the binary of each OpenWhisk repositories is packaged into tar.gz file, and uploaded into the staging repository.
- **Phase 3: release of Docker image packages**: the Docker images of each OpenWhisk repositories are packaged into tar.gz files, if available, and uploaded into the staging repository.

## List of OpenWhisk repositories to be released

We plan to release the following OpenWhisk repositories:
- OpenWhisk core: [incubator-openwhisk](https://github.com/apache/incubator-openwhisk)
- OpenWhisk runtimes:
    - [incubator-openwhisk-runtime-nodejs](https://github.com/apache/incubator-openwhisk-runtime-nodejs)
    - [incubator-openwhisk-runtime-swift](https://github.com/apache/incubator-openwhisk-runtime-swift)
    - [incubator-openwhisk-runtime-php](https://github.com/apache/incubator-openwhisk-runtime-php)
    - [incubator-openwhisk-runtime-python](https://github.com/apache/incubator-openwhisk-runtime-python)
    - [incubator-openwhisk-runtime-java](https://github.com/apache/incubator-openwhisk-runtime-java)
    - [incubator-openwhisk-runtime-docker](https://github.com/apache/incubator-openwhisk-runtime-docker)
- OpenWhisk catalog: [incubator-openwhisk-catalog](https://github.com/apache/incubator-openwhisk-catalog)
- OpenWhisk API gateway: [incubator-openwhisk-apigateway](https://github.com/apache/incubator-openwhisk-apigateway)
- OpenWhisk clients:
    - [incubator-openwhisk-client-go](https://github.com/apache/incubator-openwhisk-client-go)
    - [incubator-openwhisk-cli](https://github.com/apache/incubator-openwhisk-cli)
    - [incubator-openwhisk-wskdeploy](https://github.com/apache/incubator-openwhisk-wskdeploy)

# Proposed implementation
## How to automate the release process for OpenWhisk?

Travis CI is proposed as the pipeline to walk through the download, verify, build and publish processes. 

As we can predict, OpenWhisk is going to release continuously in the future, so we propose to create directories in a
hierarchical structure with configuration files inside to map different releases and sub-releases of OpenWhisk. One major
advantage of this plan is to provide the release manager a clear and straightforward overview for the historic releases
of OpenWhisk, which is convenient to navigate and manage. Once this repository is checked-out, the footprint
of each release's configuration files can be found on the master branch.

OpenWhisk consists of dozens of projects, which means we need to manage a series of hash values(or tags) for each OpenWhisk
release or sub-release. We propose to use a JSON-format configuration file to maintain all the information. Since Travis
is used to run all the jobs, it will parse the configuration file, download the source code, based on the hash values(or tags)
saved for each repository.

The following diagram shows the structure of the repository:
```
|--incubator-openwhisk-release--|
    |--releases--|
        |--current--|   # the only directory to work with before proposing any release or sub-release
            |--config.json--|
            |--NOTICE--|
            |--LICENSE--|
            |--CHANGELOG--|
            |--...--|
        |--incubator--| # example with no sub-release
            |--config.json--|
            |--NOTICE--|
            |--LICENSE--|
            |--CHANGELOG--|
            |--...--|
        |--1.0--|       # example with sub-releases
            |--milestone-1--|
                |--config.json--|
                |--NOTICE--|
                |--LICENSE--|
                |--CHANGELOG--|
                |--...--|
            |--milestone-2--|
                |--config.json--|
                |--NOTICE--|
                |--LICENSE--|
                |--CHANGELOG--|
                |--...--|
        |--...--|
```

This OpenWhisk release project is a Github project, and it is targeting the release managers of OpenWhisk as the users.
We would like to keep the development process of this repository the same as we contribute to any other Github project:
Release manager creates a fork of this repository, clones the source code locally, changes the code after switching to
a new branch, and submits the change as a pull request to the master branch of this repository.

The directory called _releases_ is created to maintain the configurations for all the releases. The directory called _current_
under _releases_ is the only directory to work on, before release manager proposing any release or sub-release. The release
manager use _current_ as the working directory to try out the hash values or tags to be picked from OpenWhisk repositories.
When OpenWhisk is about to have a new release, a directory named after the release name will be created, to host all the
configuration files for this release. If there is a sub-release, a directory named after the sub-release name will be
created under the corresponding directory with the release name, to host all the configuration files for this sub-release.

## How does the release manager work on this repository to propose a OpenWhisk release/candidate?

Since the directory _current_ is the only place to work on before any release or sub-release is determined, the release
manager can add or change a certain OpenWhisk project's name, with a hash value or a tag by editing the configuration
file, change the NOTICE, LICENSE, CHANGELOG, or any other necessary release document within this folder.

The configuration files under the directory _current_ will help the release manager find out a combo of OpenWhisk projects
with hash values or tags as a qualified candidate to release. Each time a change is submitted as a pull request to master
branch, Travis build will be triggered to verify that combination of hash values or tags mapping to different OpenWhisk
projects. If the Travis build passes, the aggregation of OpenWhisk projects works.

Once the release manager feels confident in a certain the project set, a release can be proposed. For example, the next release
name of OpenWhisk is _incubator_, and there is no sub-release name. We can copy all the files under _releases/current_ into
the directory _releases/incubator_(create one if it is missing), and submit this change as a PR to this master branch. When
this PR is merged into master and becomes a valid commit, the release manager can tag it with the name _incubator_, in order
to kick off a Travis build to publish the packages into Apache/staging repository.

## TBD:
**We can publish the packaged artifacts into staging repository before sending out the note for the community to vote on.
After we reach an agreement for this release, move the packaged artifacts from the staging repository to the public
Apache directory for release.** (Thinking in progress)

## How do we make Travis builds select different configuration files as input, based on different releases?

There are three types of event-driven Travis builds for this repository, we can take full advantage of.

* **PR-based Travis build**: the Travis build triggered by a pull request. Pull request is a change request, so we do not
need this type of build to pack and publish the packages. This type of Travis build pulls down the source based on the defined
hash values of each repository of OpenWhisk projects, verify the code compliance, deploy the OpenWhisk environment, and test
the OpenWhisk environment. It always runs based on the configuration files under **_releases/current_**.

* **Push-based Travis build**: the Travis build triggered by a push into master branch. A push event to the master is the
affirmation of a pull request, this type of build will definitely do the same thing as PR-based Travis build does, based on
the configuration files under **_releases/current_**. However, it still does not need to pack and publish the packages.

* **Tag-based Travis build**: the Travis build triggered by git tag. Adding/changing a git tag can kick off the Travis build,
which will be used by the release manager to trigger a release for OpenWhisk. This type of build needs to pack and publish the
packages into the Apache directory/staging repository, in addition to what PR-based Travis build or push-based Travis
build has done. We propose to have a stringent naming convention for the git tags. It must include the same release name
as the OpenWhisk release name, and the sub-release name, so that this type of Travis build can pick up and find the
configuration files under **the directory named after the release name**.

For example, if the major release of OpenWhisk is _1.0_, and the sub-release is milestone-1, the release manager should
create a directory named _1.0_ under _releases_, and a directory _milestone-1_ under _1.0_. After copy all the configuration
files under _releases_/_current_ (because the release manager has used this directory to develop a new groups of hashes or
tags for the coming release) into _releases_/_1.0_/_milestone-1_, the release manager submit a PR with the changes. When
the PR is merged, a new commit in master branch is generated. The new tag named _1.0_-_milestone-1_ needs to be created,
to kick off the Travis build, which will run based on the configuration files under _releases_/_1.0_/_milestone-1_. 

There are plenty of Travis built-in variables we can use to identify the type of Travis build. We pick up different source
code of OpenWhisk as the input to the Travis build pipeline, according to the type.



