# Sign the artifacts

Each package needs to be accompanied by cryptographic signatures according to Apache release policy.

## Generate the PGP key pair

You can either follow the [online PGP instruction](https://support.symantec.com/en_US/article.HOWTO41935.html) to generate the PGP key for your environment, or use our script to
generate for you. First, you need to config _pgp_key_gen.conf_ under the folder _tools_. Make sure you have the proper
Name-Real, Name-Comment, Name-Email, and Passphrase for your key. You do not need to change Key-Type, Key-Length, and
Expire-Date. Run the following script under the folder _tools_:

```
$ ./generate_pgp_key.sh
```

## Sign the artifacts:

All the artifacts can be signed by running the following script under _tools_:

```
$ ./sign_artifacts.sh <WORK_DIR>
```

The <WORK_DIR> should be the same one used to download the source code. This script generates a file of the MD5 checksum suffixed with .md5,
a file of the SHA512 checksum suffixed with .sha512, and a signature file suffixed with .asc for each package.
