#!/bin/sh 
if
PPTP=`ip ro | awk '/172.0.0.0/ {print $1}'`;
test "$PPTP" = "172.0.0.0/24"
then
exit;
else
if
PPTPup=`ip ro | awk '/10.0.0.1/ {print $1}'`;
test "$PPTPup" != ""
then
route add -net 172.0.0.0 netmask 255.255.255.0 gw 10.0.0.1
else
exit;
fi
fi
exit;
