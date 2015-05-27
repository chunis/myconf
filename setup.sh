#!/bin/sh

myconf=~/.myconf
replace_files="myconf bashrc gdbinit gitconfig hgrc vim vimrc xprofile"
date=`date +%Y%m%d`

echo "Backup config files and create soft link for them..."
for f in $replace_files; do
	if [ -h ~/.$f ]; then
		echo rm -f ~/.$f
		rm -f ~/.$f
	fi
	if [ -f ~/.$f -o -d ~/.$f ]; then
		echo mv ~/.$f ~/.$f-$date
		mv ~/.$f ~/.$f-$date
	fi

	ln -s $myconf/dot_files/$f ~/.$f
done

rm -f ~/.myconf
ln -s `pwd` ~/.myconf
