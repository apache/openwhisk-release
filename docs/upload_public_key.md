# Upload the public PGP key

The public PGP key file is named _KEYS_ available under the [staging directory](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/). If you generate a new key to
sign the artifacts, you need to update the file of public key in the staging directory for further use to verify the
artifacts. Checkout the [staging directory](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/) via subversion,
modify the file KEYS by appending your local public key, and commit it back to the staging directory.

You can export your public PGP key by running the following command:

```
$ pgp --export <key_id>
```

The parameter <key_id> can be either the key id or the email address you used to generate the key. For detailed information
on PGP keys, please visit [how to create and manage PGP keys](https://support.symantec.com/en_US/article.HOWTO41935.html).
