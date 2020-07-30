#!/bin/bash

# FOR APP_VM

# ========== CREATE USER ===========
useradd -m -s /bin/bash $APP_USER
echo -e "$PASS\n$PASS\n" | sudo passwd $APP_USER

# ================= INSTALL JAVA AND GIT ========================
apt -y update
apt install -y openjdk-11-jdk
cd /home/vagrant && git clone $URL
cp /vagrant/application-mysql.properties $PROJECT_DIR/src/main/resources/application-mysql.properties
cd $PROJECT_DIR && ./mvnw test && ./mvnw package
cp $PROJECT_DIR/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar  $APP_DIR



# su -l $APP_USER -c 'java -jar  spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql'
# sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log &
# /vagrant/Healthcheck.sh
