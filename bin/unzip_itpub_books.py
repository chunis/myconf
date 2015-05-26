#!/usr/bin/python

import os, sys

def unarchive(file):
	os.system("unrar x '%s'" %file)

if len(sys.argv) < 2:
	print "Usage: $0 <path>"
	sys.exit()

files = os.listdir(sys.argv[1])
filelist = [ x for x in files if x.endswith('.rar') and x.startswith('[itpub.net]') ]
filelist.sort()

for x in filelist:
	print "unarchive %s" %x
	unarchive(x)
