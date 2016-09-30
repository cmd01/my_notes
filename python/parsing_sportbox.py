#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

url = 'http://news.sportbox.ru/tv?date=2016-10-1'
page = requests.get(url)
soup = BeautifulSoup(page.text, "lxml")
n = 1
m = 1
k = 0
res = []
p = " ^  ^  ^      ^ "

while n < 150:
        channel = 'channel-' + str(n) + '-js'
        h1 = soup.find_all("div", class_=channel)
        for elem in h1:
                res.append(str(m))
        m+=1
        n+=1

while k < len(res):
        channel = 'channel-' + res[k] + '-js'
        h2 = soup.find_all("div", class_=channel)
        for elem in h2:
                print ('===============================================================================================================')
                print(elem.a.contents[0])
                print ('===============================================================================================================')
                for r in elem.find_all("div", class_="tv_transmission_container"):
                        l = r.div.span.contents[0]
                        g = r.div.contents[2]
                        #if p in g:
                        print(g, l)
        k+=1
