#!/bin/bash

cwd=$(pwd)
#This bash script and sql-scripts must be located is the same folder in order to successfully run.
#SQL-script names must match the following pattern: 045.cretetable.sql, 047createtable.sql, etc.

printf "Please specify current version of the db: \n"
read ver

for filename in "$cwd"/*.sql; do
	if [ "$ver" -ge $(echo $filename | egrep -o [0-9]+) ]; then
		:		#nothing is executed
	else
		printf "Executing script: $filename ... \n"		#executing higher version sql-scripts 
		ver=$(echo $filename | egrep -o [0-9]+)		#updating database version
fi
done

printf "Database version: $ver \n" 
