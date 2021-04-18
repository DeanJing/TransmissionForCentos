#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo -e "\033[31m =============================================================\033[0m"
echo -e "\033[33m  脚本名：  Transmission一键脚本 for Centos \033[0m"
echo -e "\033[33m *此脚本发布在 http://vpsoff.com \033[0m"
echo -e "\033[31m =============================================================\033[0m"
# http://dadi.me/ dadi.ME
# 2013.03.30
# Transmission | Centos


# START
yum update
yum -y install epel-release
yum -y install transmission
yum -y install transmission-daemon

# SETTINGS.JSON
systemctl stop transmission-daemon.service
wget --no-check-certificate https://raw.githubusercontent.com/DeanJing/TransmissionForCentos/master/settings.json
chmod +x settings.json
mkdir -p /var/lib/transmission-daemon/info
mv -f settings.json /var/lib/transmission-daemon/info/
mkdir /var/lib/transmission-daemon/downloads
mkdir -p /home/transmission/Downloads/
chmod -R 777 /var/lib/transmission-daemon/downloads
systemctl stop firewalld.service            #停止firewall
systemctl disable firewalld.service        #禁止firewall开机启动
systemctl start transmission-daemon.service
systemctl enable transmission-daemon.service
# END
clear
echo "Done."
echo " "
echo "Web GUI: http://your ip:$port/"
echo -e "\033[31m注意：请在VPS安全组以及BT面板里打开端口1989和51413\033[0m"
chkconfig transmission-daemon on
