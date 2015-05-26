#!/usr/bin/python

import sys, os
import ftplib

ip, usr = sys.argv[1:]
data = { 'cx': 'cs',
		'dx': 'ds',
		'ex': 'es',
		'fx': 'fs',
		'gx': 'gs',
		'mx': 'ms',
		'nx': 'ns',
		'abc': '123' }
try:
	ftp = ftplib.FTP(ip, "dx", "ds", timeout=1)
except:
	#print "Failed:", ip
	pass
else:
	print "%s is what you want" %ip
	ftp.quit()
	os.system("filezilla %s:%s@%s" %(usr, data[usr], ip))
