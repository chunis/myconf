#!/usr/bin/env python

import sys

file = open(sys.argv[1], 'r')
line = file.readline()
while line:
	print line.rstrip()
	line = file.readline()
