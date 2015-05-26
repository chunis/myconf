#!/bin/sh

# to power pc

_ip=10.0.0.11
#_user=denny
#_ip=192.168.1.4
_user=chunis
_backdir=/home/chunis

# change below line to suite your case
#dirs="bin Desktop git hg kylin mess mydoc myproj pl sunny ws/books x ywork z"
#dirs="bin git hg mydoc myproj pl sunny ws/books x z"
dirs="bin Desktop focus/new git hg mydoc myproj pl sunny ws/books x z"

## kylin, mess, ywork

echo -n "Input ip ($_ip): "
read ip
[ "$ip" = "" ] && ip=$_ip

echo -n "Input username ($_user): "
read user
[ "$user" = "" ] && user=$_user

echo -n "using '--del'? [y] "
read del
if [ "$del" = "" -o "$del" = "y" -o "$del" = "Y" ]; then
	del='--del'
else
	del=
fi

for file in $dirs; do
	#echo "rsync -avz $del $file/ $user:$pswd@$ip:/chunis/$file"
	#rsync -avz $del $file/ $user:$pswd@$ip:/home/chunis/$file

	echo "-------------- dir: $file --------------"
	rsync -av $del ~/$file/ $user@$ip:$_backdir/$file
done
