# Zotero

## Remove all tags
```
delete from itemTags where itemTags.tagID in (select tags.TagID from tags);
delete from tags where name != "";
```

## Windows Symbolic Link
```bash
# Soft link to a file
mklink Link Target

# Soft link to a directory
mklink /D Link Target

# Hard link to a file
mklink /H Link Target

# Hard link to a directory, or directory junction
mklink /J Link Target
```
