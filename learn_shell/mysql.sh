# 备份单个数据库
mysqldump -u username -p test > bak.sql

# 备份多个或所有数据库
mysqldump -u username -p --databases test1 test2 > bak.sql
mysqldump -u username -p -all-databases > bak.sql

# 备份数据库中一张或多张表
mysqldump -u username -p test person1 person2 > bak.sql

# 数据还原：
mysql -u root -p < bak.sql
