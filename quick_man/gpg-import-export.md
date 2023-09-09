## Export public key

```
gpg --export your_address@example.net > my_key.pub 
```

The file can then be shared to other people.

## Export public key in armor ascii format

```
gpg --armor --export YOUR_KEY_ID_HERE
```

This text can then be used on Github for example to verify commits.

## Export secret key

```
gpg --output mygpgkey_sec.gpg --armor --export-secret-key ABCDFE01
```

## Import public and secret keys on the other machine

```
gpg --import ~/mygpgkey_pub.gpg
gpg --allow-secret-key-import --import ~/mygpgkey_sec.gpg
```

## Import public and secret keys encrypted by password

```
gpg --decrypt mygpgkey.sec.pgp | gpg --import
```
