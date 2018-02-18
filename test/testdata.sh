#!/bin/bash

#=========================HEADER==========================================
#name: testdata.sh
#Description: test file for bmtData
#Written : Gavin Lyons

#====================FUNCTIONS===============================
#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Linux/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done


function Test_Func
{
	echo "error check"
	bmtDataFunc foo
	echo " "
	
	## intcheck
	echo "Enter an integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	echo "$?"
	echo " "
	## alphanumeric check
	echo "Enter an alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	echo "$?"
	echo " "
	## alphanuc check
	echo "Enter an alpha string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	echo "$?"
	echo " "

}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
