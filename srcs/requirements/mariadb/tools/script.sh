# #!/bin/bash

sed -i "s/bind-address.*/bind-address = 0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf


# TODO : try to import the database from wordpress \ or try to fix the database connection 








# service mysql start 

# echo "
# # -- Delete Already Existing Root User on the Host
# DELETE FROM
#   mysql.user
# WHERE
#   User = '$MARIADB_ADMIN_USER'
#   AND Host NOT IN ('$HOST_NAME', '$HOST_IPV4', '$HOST_IPV6');

# # -- Set Password of Root User on MariaDB
# SET
#   PASSWORD FOR '$MARIADB_ADMIN_USER'@'$HOST_NAME' = PASSWORD('$MARIADB_ADMIN_PWD');

# # -- Create WordPress Database
# CREATE DATABASE IF NOT EXISTS $MARIADB_DB;

# # -- Create Another User for WordPress
# CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';

# # -- Grant Permissions
# GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;

# # -- Apply
# FLUSH PRIVILEGES;" > my_sql_file.sql

# mysql < my_sql_file.sql


#!/bin/bash
if [ "$(ls -A /var/lib/mysql)" ];then
    service mysql start 2> /dev/null;
fi

#mysql -p$MYSQL_ROOT_PASSWORD -e ""
if [ $? -ne 0 ] || [ ! -d /var/lib/mysql/wordpress ]; then
    echo "Need to config wordpress DB"
    killall mysqld
    mysql_install_db &> /dev/null;
    service mysql start 2> /dev/null;

    mysql -e "DELETE FROM mysql.user WHERE User='';";
    mysql -e "CREATE DATABASE wordpress;";
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;";
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;";
else
    echo "Wordpress DB exist already.";
fi

killall mysqld
mysqld