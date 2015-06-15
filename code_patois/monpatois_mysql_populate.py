#!/usr/bin/python

#import MySQLdb
import mysql.connector

fo = open("G:\MonPatois\code_patois\zoo.txt", "r")
cnx = mysql.connector.connect(user='b088ad2f200327', password='9687b30d', database='heroku_68c4b8be3729a2c', host='eu-cdbr-west-01.cleardb.com')


# Open database connection
#db = MySQLdb.connect("localhost","root","judith","monpatois" )

# prepare a cursor object using cursor() method
cursor = cnx.cursor()

for line in fo.read().splitlines():
	print line
	# Prepare SQL query to INSERT a record into the database.
	sql = ('INSERT INTO words (french, created_at, updated_at)'
	         ' VALUES ("'+line+'", "2015-05-21 20:00:00", "2015-05-21 20:00:01")')
	try:
	    #Execute the SQL command
		cursor.execute(sql)
	   # Commit your changes in the database
		cnx.commit()
	except:
	   # Rollback in case there is any error
	#   print "error"
	   cnx.rollback()

# disconnect from server
cursor.close()
cnx.close()
fo.close()