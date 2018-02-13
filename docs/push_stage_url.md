# Publish the release artifacts to the staging directory

After the artifacts are generated and signed, you can run the following script under the folder _tools_, to upload them
into the staging directory:

```
$ ./upload_artifacts.sh <WORK_DIR>
```

The <WORK_DIR> should be the same one used to download the source code. This script will create a remote directory named
openwhisk-\<major\>-\<minor\> under the staging directory, and push all the files available locally under openwhisk-\<major\>-\<minor\>
upstream. It will overwrite the old files or directories, if the directory openwhisk-\<major\>-\<minor\> is available as a svn folder.
