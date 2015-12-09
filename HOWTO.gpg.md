# Brief description on how to use GPG

First create a key:

    $ gpg --gen-key

The defaults should just do fine. Just make sure
your password is long enough. Remember your
`KEY-ID` (I usually use my email address).

Then export your private key and store it away in
a secure place.

    $ gpg -a --export-secret-keys <KEY-ID> > /backup/my.priv.key

Do the same with the revocation certificate for
your primary public key.

    $ gpg gpg --output /backup/my.pub.key-revoke.asc --gen-revoke <KEY-ID>

In case your private key gets compromised you shuold
immediately publish the revocation certificate.

# Resources

* https://gist.github.com/chrisroos/1205934
* https://www.gnupg.org/gph/en/manual/book1.html and in particular
  https://www.gnupg.org/gph/en/manual/c14.html#REVOCATION

