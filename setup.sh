#!/bin/sh

myconf=~/.myconf

if [ -s $myconf ]; then
	rm -f $myconf
fi

ln -s `pwd` $myconf
