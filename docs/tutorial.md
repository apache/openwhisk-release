# Release Manager Tutorial

This project offers the release manager of OpenWhisk two modes to release OpenWhisk projects: manual mode and automated mode.
Manual mode makes sure that the release manager can download the source code of this repository, and go through the release
process by running scripts sequentially on a local machine, to push the artifacts into the staging directory and eventually
move them into the Apache release directory. Automated mode provides the release manager another option to walk through the
Apache release process by kicking off the Travis job to run the scripts. A release manager can choose either way to publish
the artifacts in the staging directory and the Apache release directory.

## Manual mode of Release Process
  1. [Preparing for a release](prepare_release.md) - how to prepare OpenWhisk projects for a release
  2. [Prerequisites](prerequisites.md) - steps that release manager needs to do before a release
  3. [Picking up the source code](pick_up_source_code.md) - determine the branch and hash value for each OpenWhisk project to release
  4. [Making the release artifacts](package_artifacts.md)
  5. [Signing the release artifacts](sign_artifacts.md)
  6. [Uploading public PGP key](upload_public_key.md)
  7. [Publish the release artifacts to the staging directory](push_stage_url.md)
  8. Vote on the dev@openwhisk.apache.org list
  9. If the vote fails - configure the file config.json and resume from step 3
  10. [Publish the release artifacts to Apache release directory](publish_apache_directory.md)
  11. Announce the release
