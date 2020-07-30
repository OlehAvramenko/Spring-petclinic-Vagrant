#!/bin/bash

<<<<<<< HEAD:everyboot_APP.sh
sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log_Mysql || sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar >> $APP_DIR/log_H2 &
=======
sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log &
>>>>>>> ab8544e2c2786217fede06c9680f0f5dba4d6fc1:evryboot.sh
/vagrant/health.sh
