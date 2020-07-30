#!/bin/bash

check=`iptables -L | grep DROP | wc -l`
if [ "$check" -eq 0 ]
then
iptables-restore < /etc/iptables_DB.rules && echo " ================== IPTABLES rules was restored! ======================"
fi
