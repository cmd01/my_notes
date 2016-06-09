#!/usr/bin/env python3
import os
import xml.etree.ElementTree as etree

XML_FILE = os.path.join(os.environ['HOME'], 'xmlfile.xml')

tree = tree.parse('/home/cmd01/xmlfile.xml')
root = tree.getroot()
print(root)
print(root.tag)
for child in root:
		print(child)
print(root.attrib)
print(root[4])
print(root[4].attrib)
p = tree.find('AUD')
print (p)