#!/bin/bash

# debug
set -e

service vsftpd start

# create user
adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 

# set directory
mkdir -p /var/www/html
chown -R $FTP_USER:$FTP_USER /var/www/html

# configuring vsftpd
sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "local_root=/var/www/html" >> /etc/vsftpd.conf
echo "pasv_min_port=50000" >> /etc/vsftpd.conf
echo "pasv_max_port=50005" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd
