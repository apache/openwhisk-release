# Making the release artifacts

The artifacts to be made in this step consists of the source code packages, binary packages and docker image packages.
As the deliverable of the [first phase](general_spec.md#different-phases-of-implementations), we currently only build the
source code packages. Binary and docker image are on our future agenda.

After downloading the source code, we can run the following script under _tools_ to generate the artifacts for each OpenWhisk project:
```
$ ./package_source_code.sh <WORK_DIR>
```
The <WORK_DIR> should be the same one used to download the source code. This script will create a source code package file
of source code suffixed with tar.gz for each project, under <WORK_DIR>/openwhisk_sources/openwhisk/openwhisk-\<major\>-\<minor\>.
The keys major and minor are defined in _config.json_.
