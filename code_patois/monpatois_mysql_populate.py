#!/usr/bin/python

#import MySQLdb
import mysql.connector

fo = open("C:\Users\Teddy\Documents\code_patois\zoo.txt", "r")
cnx = mysql.connector.connect(user='root', password='judith', database='monpatois', host='localhost', port='3306')


# Open database connection
#db = MySQLdb.connect("localhost","root","judith","monpatois" )

# prepare a cursor object using cursor() method
cursor = cnx.cursor()

for line in fo.read().splitlines():
	#print line
	# Prepare SQL query to INSERT a record into the database.
	sql = ('INSERT INTO words (french, created_at, updated_at)'
	         ' VALUES ("'+line+'", "2015-05-21 20:00:00", "2015-05-21 20:00:01")')
	try:
	    Execute the SQL command
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