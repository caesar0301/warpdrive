# zip, tar, tar.gz, tar.bz2

# compress \n decomporess

# zip: generally available
zip -r archive_name.zip directory_to_compress
unzip archive_name.zip

# tar: low compression ratio
tar -cvf archive_name.tar directory_to_compress
tar -xvf archive_name.tar.gz -C /tmp/extract_here/

# tar.gz: most efficient
tar -zcvf archive_name.tar.gz directory_to_compress
tar -zxvf archive_name.tar.gz -C /tmp/extract_here/

# tar.bz2: largest compressed ratio, cpu intensive to decompress
tar -jcvf archive_name.tar.bz2 directory_to_compress
tar -jxvf archive_name.tar.bz2 -C /tmp/extract_here/
