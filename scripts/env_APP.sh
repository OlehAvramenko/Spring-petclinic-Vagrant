#!/bin/bash

echo "export DB_HOST=172.17.177.21" >> /etc/profile.d/myvar.sh
echo "export DB_PORT=3306" >> /etc/profile.d/myvar.sh
echo "export DB_NAME=petclinic" >> /etc/profile.d/myvar.sh
echo "export DB_USER=petclinic" >> /etc/profile.d/myvar.sh
echo "export DB_PASS=petclinic" >> /etc/profile.d/myvar.sh
echo "export PROJECT_DIR=/home/vagrant/spring-petclinic" >> /etc/profile.d/myvar.sh
echo "export APP_USER=app_user" >> /etc/profile.d/myvar.sh
echo "export APP_DIR=/home/app_user/" >> /etc/profile.d/myvar.sh
echo "export PASS=root232" >> /etc/profile.d/myvar.sh
echo "export URL=https://github.com/spring-projects/spring-petclinic.git" >> /etc/profile.d/myvar.sh
