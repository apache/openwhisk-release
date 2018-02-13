# Publish the release artifacts to Apache release directory

## Move the artifacts from the staging directory to the Apache release directory

We shall not proceed this step unless we have reached the consent from the community to promote a release. Run the following
script under _tools_ to accomplish this task:
```
$ ./move_stage_to_release.sh
```

## Tag the release in git

All the hash values are available in the configuration file config.json for each OpenWhisk project. We need to tag them
with the name of the release, e.g: \<major\>-\<minor\>.
