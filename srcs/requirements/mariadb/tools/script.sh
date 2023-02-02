#!/bin/bash

sed -i "s/bind-address.*/bind-address = 0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf;


# # TODO : try to import the database from wordpress \ or try to fix the database connection 


# /usr/bin/install -m 755 -o mysql -g root -d /var/run/mysqld





# # service mysql start 




# if [ "$(ls -A /var/lib/mysql)" ];then
#     service mysql start 2> /dev/null;
# fi

# #mysql -p$MYSQL_ROOT_PASSWORD -e ""
# if [ $? -ne 0 ] || [ ! -d /var/lib/mysql/wordpress ]; then
#     echo "Need to config wordpress DB"
#     killall mysqld
#     mysql_install_db &> /dev/null;
#     service mysql start 2> /dev/null;

#     mysql -e "DELETE FROM mysql.user WHERE User='';";
#     mysql -e "CREATE DATABASE '$MYSQL_DATABASE';";
#     mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
#     mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;";
#     mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;";
# else
#     echo "Wordpress DB exist already.";
# fi




chown -R mysql:mysql /var/lib/mysql;
chmod 777 /var/run/mysqld;


# service mysql start 







echo "
# -- Delete Already Existing Root User on the Host

# -- Set Password of Root User on MariaDB
SET
  PASSWORD FOR 'root'@'localhost' = PASSWORD('root69');

# -- Create WordPress Database
CREATE DATABASE IF NOT EXISTS mydb;

# -- Create Another User for WordPress
CREATE USER 'hamid'@'%' IDENTIFIED BY 'hamid69';

# -- Grant Permissions
GRANT ALL PRIVILEGES ON mydb.* TO 'hamid'@'%' WITH GRANT OPTION;

# -- Apply
FLUSH PRIVILEGES;" > my_sql_file.sql



mysql -u root -proot69 < my_sql_file.sql





# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql





# echo "CREATE DATABASE if not exists thedata;" > db.sql
# echo "CREATE USER 'hamid'@'%';" > db.sql
# echo "GRANT ALL PRIVILEGES ON thedata.* to 'hamid'@'%' IDENTIFIED BY 'hamid69';" > db.sql
# echo "alter user 'root'@'localhost' identified by 'rootpassword';" > db.sql
# echo "FLUSH PRIVILEGES;" > db.sql 



# # echo "DELETE FROM mysql.user WHERE User='';" >> db.sql
# echo "CREATE DATABASE thedata;" >> db.sql
# echo "CREATE USER IF NOT EXISTS 'hamid'@'%' IDENTIFIED BY 'hamid69';" >> db.sql
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO hamid@'%' WITH GRANT OPTION;" >> db.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpassword';FLUSH PRIVILEGES;" >> db.sql


# echo "CREATE DATABASE IF NOT EXISTS mydb ;
# CREATE USER IF NOT EXISTS 'hamid'@'%' IDENTIFIED BY 'hamid69';
# GRANT ALL PRIVILEGES ON mydb.* TO 'hamid'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'root69';
# FLUSH PRIVILEGES;" > db.sql



# chmod 777 db.sql


# mysql -u root -p"root69" < mydb.sql

# mysqld_safe
# mysqld
# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld


# killall mysqld

# service mysql start

# kill $(cat /var/run/mysqld/mysqld.pid)
# mysql -u root -p"root69" < mydb.sql

# mysql < mydb.sql
# killall mysqld


# mysql


bash
