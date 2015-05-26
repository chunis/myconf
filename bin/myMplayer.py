#!/usr/bin/python

# Author: chunchengfh
# About: use mplayer to random play mp3s.
# Usage: 'Ctrl-C' exit current music; Double 'Ctrl-C' exit the program.
#        Or use mplayer's commands to control the play.

import os, sys
import random, time

def play(name):
	print 'Play %s now...' %name
	os.system('mplayer "%s"' %name)


if len(sys.argv) == 1:
	print 'Usage: %s <mp3files>' %sys.argv[0]
	exit

new = []
music = sys.argv[1:]
num = len(music)
while num > 0:
	num -= 1
	index = random.randint(0, num)
	# print index
	new.append(music[index])
	del music[index]

for name in new:
	if os.path.isfile(name):
		play(name)
		time.sleep(0.5)
