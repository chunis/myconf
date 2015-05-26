#!/bin/sh

DIR=/home/chunis/code/unpv13e/
APP=$(echo $1 | sed 's/\.c$//')
#echo $APP

gcc -Wall -o $APP ${APP}.c -I$DIR/lib -L$DIR -lunp
