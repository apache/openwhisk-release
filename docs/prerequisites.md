# Release Prerequisites

## Operating Systems

This project is only supported under Mac or Ununtu operating system.

## Software packages

The following software packages are required for your operating system.
 
 - git and svn
 - jq
 - gpg or gnupg and expect

## Download the source code

Open a terminal, go to the directory where you save the source code, and run
```
$ git clone https://github.com/apache/incubator-openwhisk-release.git
```

## Install the dependencies

Normally, Mac or Ubuntu will have some the packages installed by default. Suppose _$OPENWHISK_RELEASE_ is the home directory
of openwhisk release on your local machine. You can run the script _install_dependencies.sh_ under the folder _tools_
to install the software packages:
```
$ cd $OPENWHISK_RELEASE/tools
$ ./install_dependencies.sh
```

For some old versions of Ubuntu, you probably need to run _sudo apt-get update_ before running the script to install
dependencies.
