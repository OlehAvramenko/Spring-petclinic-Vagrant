#!/bin/bash

sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log_Mysql || sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar >> $APP_DIR/log_H2 &
# sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log &
/vagrant/health.sh
