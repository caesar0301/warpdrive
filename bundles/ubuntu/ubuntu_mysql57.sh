## Change default password for mysql 5.7 on ubuntu

Open & Edit /etc/mysql/my.cnf, depending on your distro.
Add skip-grant-tables under [mysqld]
Restart Mysql

You should be able to login to mysql now using the below command mysql -u root -p
Run mysql> flush privileges;

For MySQL 5.7.6 and newer as well as MariaDB 10.1.20 and newer, use the following command:
Run mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';

For MySQL 5.7.5 and older as well as MariaDB 10.1.20 and older, use:
Run mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password');

For auth_socket not loaded error:
use mysql;
update user set plugin="mysql_native_password";
flush privileges;

Go back to /etc/my.cnf and remove/comment skip-grant-tables
Restart Mysql
Now you will be able to login with the new password mysql -u root -p
