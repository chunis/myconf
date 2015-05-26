#!/bin/sh

# echo -e "\033[45m good \033[m"
myecho ()
{
	color=44
	echo "[${color}m$*[m"
}
