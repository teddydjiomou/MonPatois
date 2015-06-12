from xml.etree import ElementTree as ET

doc = ET.parse("apl_out.xml").getroot()

for general in doc.findall('general'):
	displays = general.findall('display')
	for display in displays:
		if "name" in display.keys():
			if display.attrib['name'] == 'Energia prodotta ieri':
				print display.text
				break
			
	
   
