#!/bin/bash

#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#name: testdata.sh
#Description: test file for bmtData
#Written : Gavin Lyons

# === FUNCTIONS ===

#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done


function Test_Func
{
	echo "Error handling check"
	bmtDataFunc foo
	echo " "
	
	# intcheck
	echo "601"
	echo "Enter an integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	echo "$?"
	echo " "
	
	## alphanumeric check 2
	echo "602"
	echo "Enter an alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	echo "$?"
	echo " "
	
	## alphanuc check 3
	echo "603"
	echo "Enter an alpha string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	echo "$?"
	echo " "
	
	## lowercase 4
	echo "604"
	echo "lowercasetest"
	result=$(bmtDataFunc lowercase "TEST")   # or result=`myfunc`
	echo "$result"
	echo " "
	
	##uppercase 5
	echo "605"
	echo "uppercasetest"
	result1=$(bmtDataFunc uppercase "test")
	echo "$result1"
	echo " "
	
	## trim 6
	echo "606"
	echo "trim test"
	mytrim="       test   "
	result2=$(bmtDataFunc trim "$mytrim")
	echo "$result2"
	echo " "

	## string length 7
	echo "607 string length test"
	bmtDataFunc strlen "test string 123" # 15
	echo $?
	echo " "
	bmtDataFunc strlen "" #report 250 error
	echo $?
	echo " "
}

Test_Func
# === END ===
