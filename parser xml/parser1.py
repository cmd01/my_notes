#!/usr/bin/env python3
from xml.dom.minidom import parse, parseString
import urllib2
# note - i convert it back into xml to pretty print it
print parse(urllib2.urlopen("http://www.cbr.ru/scripts/XML_daily.asp?")).toprettyxml(encoding="utf-8")