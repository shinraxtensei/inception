# #!/bin/bash

service vsftpd start

adduser hamid --disabled-password --gecos ""
echo "hamid:hamid" | chpasswd

echo "hamid" >> /etc/vsftpd.userlist

mkdir /home/hamid/ftp
chown -R hamid:hamid /home/hamid/ftp

sed -i 's/#local_enable=YES/local_enable=YES/g' /etc/vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf


echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/hamid/ftp
pasv_min_port=30000
pasv_max_port=30010
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd restart

