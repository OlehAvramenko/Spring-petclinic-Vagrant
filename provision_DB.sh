#!/bin/bash

#  SET ENV
export DB_USER=petclinic
export DB_PASS=petclinic
export DB_NAME=petclinic

#  CREATE USER
useradd  -m $DB_USER
echo -e "$DB_PASS\n$DB_PASS\n" | sudo passwd $DB_USER

#   ================================== INSTALL MYSQL ======================================
apt -y update

echo "mysql-server-5.5 mysql-server/root_password_again password root232" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password password root232" | debconf-set-selections
apt-get -y install mysql-server

# =============== CHECK MYSQL =======================

TSTMYSQL=`/etc/init.d/mysql status | grep stop`
if [ "$TSTMYSQL" == "mysql stop/waiting" ]; then
echo " =================== TRYING TO START MYSQL ======================"
/etc/init.d/mysql start
fi

# ============================ GIVE ACCESS ===========================
mysql -u root  -proot232  -e "CREATE USER '$DB_USER' IDENTIFIED BY '$DB_PASS'"
mysql -u root  -proot232  -e  "CREATE DATABASE $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
mysql -u root  -proot232  -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'"

#  ======================== CONFIGURE IPTABLES AND ACCESS ========================
iptables -P INPUT DROP
iptables -A INPUT -p tcp -s 127.0.0.1  -j ACCEPT
iptables -A INPUT -p tcp -s 172.17.177.0/24   -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

# ============================ CHECK ACCESS ===========================
mysql $DB_NAME -u $DB_USER -p$DB_PASS || echo "====================== COULD NOT GET ACCESS ========================"

