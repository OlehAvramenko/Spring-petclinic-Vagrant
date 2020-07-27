#!/bin/bash
sleep 60
https=localhost:8080
status=`curl $https -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`    
echo " ========== TESTING $https=$status ========== "
