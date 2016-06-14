#!/usr/bin/env python3
f = open('users.txt', 'r')
a = f.readlines()
for i in a:
	if len(i) > 8:
		print(i)

f.close()