#!/bin/bash

#Author : HuanMeng
#Blog : https://ihuanmeng.com
#Twitter : https://twitter.com/HuanMeng_
#I hope you can follow me on Twitter!

#FAQ
#ReductLICMACADDR:Before the MAC address
#NIC:NIC name. e.g. eth0
#MODE: Install or Start with the system (0 or 1)
#example: sh serverspeedercrack.sh 56:00:00:1E:BB:25 eth0 1

#Acknowledgements:
#ServerSpeeder Team [Developers!]
#Diaoji (233.wiki) [Provided Test VPS]
#文韬武略 (share123.org) [Provided ServerSpeeder Package]

#Finally,Cheers!

LICMACADDR="80:0C:A9:92:4B:36"
RUNDIR=$(pwd)
ReductLICMACADDR=$1
NIC=$2
RUNMODE=$3

function Change_MACADDR_lic(){
ifconfig ${NIC} down
ifconfig ${NIC} hw ether ${LICMACADDR}
ifconfig ${NIC} up
}

function Change_MACADDR_reduct(){
ifconfig ${NIC} down
ifconfig ${NIC} hw ether ${ReductLICMACADDR}
ifconfig ${NIC} up
service network restart
}

function Install_ServerSpeeder(){
bash ${RUNDIR}/source/install.sh
Change_MACADDR_lic;
service serverSpeeder restart
Change_MACADDR_reduct;
service serverSpeeder status
echo 'INSTALL COMPLETE!'
echo 'NOTICE:YOU CAN CHECK WHETHER IT IS RUNNING!'
echo 'THANK YOU FOR YOUR USE!'
echo 'Author : HuanMeng  Twitter : https://twitter.com/HuanMeng_'
echo 'I hope you can follow me on Twitter!'
}

if [ $RUNMODE == "0" ]; then
Install_ServerSpeeder;
elif [ $RUNMODE == "1" ]; then
Change_MACADDR_lic;
service serverSpeeder restart
Change_MACADDR_reduct;
service serverSpeeder status
echo 'NOTICE:CHANGE MAC COMMAND WAS SUCCESSD TO RUN!'
echo 'NOTICE:YOU CAN CHECK WHETHER IT IS RUNNING!'
echo 'THANK YOU FOR YOUR USE!'
echo 'I hope you can follow me on Twitter!'
fi

exit 