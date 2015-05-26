#! /bin/sh

line=`wc -l $1 | awk '{print $1}'`
while [ $line -gt 0 ]
do
	sed -n "${line}p" $1
	line=$(($line - 1))
done
