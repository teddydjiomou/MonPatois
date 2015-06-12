import urllib2

hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}
francais = [line.strip() for line in open("fr.txt")]
anglais = open("fr_traductions.txt", 'w')
for i in range(0, len(francais)):
	url = 'http://translate.google.it/translate_a/t?client=t&text=' +str(francais[i])+'&hl=fr&sl=fr&tl=en&ie=UTF-8&oe=UTF-8&multires=1&prev=btn&ssel=0&tsel=0&sc=1'
	request=
	response = urllib2.urlopen(urllib2.Request(url,headers=hdr)).read()
	indici = [l for l, x in enumerate(response) if x=='"' ]
	trad = ""
	for r in range(indici[0]+1, indici[1]):
		trad = trad+str(response[r])
	anglais.write(trad+'\n')
anglais.close()

#doc=lh.parse(response)
#for elt in doc.iter('span'):
#    text=elt.text_content()
#    print text