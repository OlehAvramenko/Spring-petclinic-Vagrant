#!/bin/bash

sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log &
/vagrant/Healthcheck.sh
