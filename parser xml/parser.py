#!/usr/bin/env python3
import os
import xml.etree.ElementTree as etree

XML_FILE = os.path.join(os.environ['HOME'], 'xmlfile.xml')

tree = etree.parse('/home/cmd01/xmlfile.xml')
root = tree.getroot()
print(root)