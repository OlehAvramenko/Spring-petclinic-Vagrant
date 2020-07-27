#!/bin/bash

sudo -E -u $APP_USER java -jar  $APP_DIR/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql >> $APP_DIR/log &
<<<<<<< HEAD:evryboot.sh
/vagrant/health.sh
=======
/vagrant/Healthcheck.sh
>>>>>>> f43afbb6ad09d9349f532e4cb16514dbfecdac8c:everyboot.sh
