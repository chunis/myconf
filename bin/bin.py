#!/usr/bin/python

def bin(x):
	result = ''
	x = int(x)
	while x > 0:
		mod = x % 2
		x /= 2
		result = str(mod) + result
	return result

if __name__ == '__main__':
	print bin(2880)
	print bin('2880')
	print bin('hello')    # will fail,  (-:
