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

## Export items as well as collection names
```sql
select attachment.path, attachment.key, item.collectionName, item.parentCollectionName FROM
(
	select itemAttachments.itemID, itemAttachments.parentItemID, itemAttachments.path, items.key 
	from itemAttachments, items 
	where items.itemID = itemAttachments.itemID
) attachment,
(
	select itemID, collectionName, parentCollectionName from collectionItems
	left join 
		(
			select a.collectionID, a.collectionName , b.collectionName parentCollectionName from collections a
			LEFT JOIN collections b ON a.parentCollectionID = b.collectionID
		) collections
	on collectionItems.collectionID = collections.collectionID
) item
WHERE attachment.parentItemID = item.itemID
;
```
