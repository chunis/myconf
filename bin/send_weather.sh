#!/bin/sh

from_phone=135xxxxxxxx
to_phone=135xxxxxxxx
passwd=xxxx

sleep 100
cliofetion -f $from_phone -p $passwd -t $to_phone -d `./fetion_weather.pl`
