# coding=utf-8

francais = [line.strip() for line in open("agriffé.txt")]
for i in range(0, len(francais)):
	mot = francais[i]
	if mot[len(mot)-2:len(mot)] == "er":
		prefix = mot[0:len(mot)-2]
		for j in range(-51,51):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"e" or francais[i+j]==prefix+"erais" or francais[i+j]==prefix+"eriez" or francais[i+j]==prefix+"erions" or francais[i+j]==prefix+"es" or francais[i+j]==prefix+"ons" or francais[i+j]==prefix+"ez" or francais[i+j]==prefix+"ent" or francais[i+j]==prefix+"a" or francais[i+j]==prefix+"ai" or francais[i+j]==prefix+"ais" or francais[i+j]==prefix+"ait" or francais[i+j]==prefix+"âmes" or francais[i+j]==prefix+"âtes" or francais[i+j]==prefix+"èrent" or francais[i+j]==prefix+"ions" or francais[i+j]==prefix+"iez" or francais[i+j]==prefix+"erai" or francais[i+j]==prefix+"erait" or francais[i+j]==prefix+"eraient" or francais[i+j]==prefix+"era" or francais[i+j]==prefix+"eras" or francais[i+j]==prefix+"erons" or francais[i+j]==prefix+"erez" or francais[i+j]==prefix+"eront" or francais[i+j]==prefix+"as" or francais[i+j]==prefix+"asse" or francais[i+j]==prefix+"asses" or francais[i+j]==prefix+"assiez" or francais[i+j]==prefix+"assions" or francais[i+j]==prefix+"ât":
					francais[i+j]="0"

	if mot[len(mot)-3:len(mot)] == "ger":
		prefix = mot[0:len(mot)-2]
		for j in range(-51,51):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"ea" or francais[i+j]==prefix+"eai" or francais[i+j]==prefix+"eait" or francais[i+j]==prefix+"eâmes" or francais[i+j]==prefix+"easse" or francais[i+j]==prefix+"eassiez" or francais[i+j]==prefix+"eassions" or francais[i+j]==prefix+"eât" or francais[i+j]==prefix+"eâtes":
					francais[i+j]="0"

	if mot[len(mot)-2:len(mot)] == "ir":
		prefix = mot[0:len(mot)-2]
		for j in range(-51,51):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"i" or francais[i+j]==prefix+"is" or francais[i+j]==prefix+"it" or francais[i+j]==prefix+"issons" or francais[i+j]==prefix+"issez" or francais[i+j]==prefix+"issent" or francais[i+j]==prefix+"irent" or francais[i+j]==prefix+"issais" or francais[i+j]==prefix+"issait" or francais[i+j]==prefix+"issions" or francais[i+j]==prefix+"issiez" or francais[i+j]==prefix+"irai" or francais[i+j]==prefix+"iras" or francais[i+j]==prefix+"ira" or francais[i+j]==prefix+"irons" or francais[i+j]==prefix+"irez" or francais[i+j]==prefix+"iront" or francais[i+j]==prefix+"iraient" or francais[i+j]==prefix+"irions" or francais[i+j]==prefix+"irais" or francais[i+j]==prefix+"irait" or francais[i+j]==prefix+"iriez" or francais[i+j]==prefix+"issaient" or francais[i+j]==prefix+"isse" or francais[i+j]==prefix+"ît" or francais[i+j]==prefix+"îtes" or francais[i+j]==prefix+"îmes":
					francais[i+j]="0"

	if mot[len(mot)-2:len(mot)] == "re":
		prefix = mot[0:len(mot)-2]
		for j in range(-51,51):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"s" or francais[i+j]==prefix+"e" or francais[i+j]==prefix+"ez" or francais[i+j]==prefix+"iez" or francais[i+j]==prefix+"îmes" or francais[i+j]==prefix+"îtes" or francais[i+j]==prefix+"ions" or francais[i+j]==prefix+"ent" or francais[i+j]==prefix+"es" or francais[i+j]==prefix+"i" or francais[i+j]==prefix+"riez" or francais[i+j]==prefix+"rions" or francais[i+j]==prefix+"ra" or francais[i+j]==prefix+"rai" or francais[i+j]==prefix+"raient" or francais[i+j]==prefix+"rais" or francais[i+j]==prefix+"rait" or francais[i+j]==prefix+"rez" or francais[i+j]==prefix+"rions" or francais[i+j]==prefix+"rons" or francais[i+j]==prefix+"ront":
					francais[i+j]="0"

for i in range(0, len(francais)):
	mot = francais[i]
	for j in range(1,11):
		if (i+j)<len(francais):
			if francais[i+j] == mot+"s" or francais[i+j] == mot+"e" or francais[i+j]==mot+"es":
				francais[i+j]="0"

for i in range(0, len(francais)):
	mot = francais[i]
	if mot[len(mot)-5:len(mot)] == "aient" or mot[len(mot)-6:len(mot)] == "assent":
		francais[i]="0"
	if mot[len(mot)-2:len(mot)] == "if":
		prefix = mot[0:len(mot)-2]
		for j in range(-21,21):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"ive":
					francais[i+j]="0"
	if mot[len(mot)-1:len(mot)] == "é":
		prefix = mot[0:len(mot)-1]
		for j in range(-21,21):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"ée" or francais[i+j]==prefix+"ées" or francais[i+j]==prefix+"és":
					francais[i+j]="0"
	if mot[len(mot)-3:len(mot)] == "eur":
		prefix = mot[0:len(mot)-3]
		for j in range(-21,21):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"euse" or francais[i+j]==prefix+"euses" or francais[i+j]==prefix+"eurs" or francais[i+j]==prefix+"rice" or francais[i+j]==prefix+"rices":
					francais[i+j]="0"
	if mot[len(mot)-2:len(mot)] == "al":
		prefix = mot[0:len(mot)-2]
		for j in range(-21,21):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"ale" or francais[i+j]==prefix+"ales" or francais[i+j]==prefix+"aux":
					francais[i+j]="0"
	if mot[len(mot)-3:len(mot)] == "eau":
		prefix = mot[0:len(mot)-3]
		for j in range(-21,21):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"eaux":
					francais[i+j]="0"
	if mot[len(mot)-2:len(mot)] == "el":
		prefix = mot[0:len(mot)-2]
		for j in range(-21,21):
			if (i+j)>0 and (i+j)<len(francais):
				if francais[i+j]==prefix+"els" or francais[i+j]==prefix+"elle" or francais[i+j]==prefix+"elles":
					francais[i+j]="0"


output = open("fr_filtrato.txt", 'w')
for i in range(0, len(francais)):
	if francais[i] != "0":
		output.write(francais[i]+'\n')
output.close()
