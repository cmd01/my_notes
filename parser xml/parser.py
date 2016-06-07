#!/usr/bin/env python3
import os
import xml.etree.cElementTree as ET

XML_FILE = os.path.join(os.environ['HOME'], 'xmlfile.xml')

try:
	tree = ET.ElementTree(file=XML_FILE)
	print help(tree)
except IOError as e:
	print ('nERROR - cant find filr: %sn' % e)