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
	
	## intcheck 1
	echo "Enter an integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	echo "$?"
	echo " "
	## alphanumeric check 2
	echo "Enter an alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	echo "$?"
	echo " "
	## alphanuc check 3
	echo "Enter an alpha string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	echo "$?"
	echo " "
	##lowercase 4
	echo "lowercasetest"
	result=$(bmtDataFunc lowercase "TEST")   # or result=`myfunc`
	echo $result
	echo " "
	##uppercase 5
	echo "uppercasetest"
	result1=$(bmtDataFunc uppercase "test")
	echo $result1
	echo " "
	##trim 6
	echo "trim test"
	mytrim="       test   "
	result2=$(bmtDataFunc trim $mytrim)
	echo $result2
	echo " "

}
#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
