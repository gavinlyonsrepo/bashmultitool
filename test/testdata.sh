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
	bmtDataFunc foofoo
	bmtTestFunc "$?" 255 "60E-a"
	bmtDataFunc 
	bmtTestFunc "$?" 255 "60E-b"
	
	# intcheck 601
	printf  "\n%s\n"  "601-a Enter an integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	bmtTestFunc "$?" 0 "601-a"

	printf  "\n%s\n"  "601-b Enter a NON integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	bmtTestFunc "$?" 2 "601-b"

	## alphanumeric 602
	printf  "\n%s\n" "602-a Enter an alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	bmtTestFunc "$?" 0 "602-a"
	
	printf  "\n%s\n" "602-b Enter a NON alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	bmtTestFunc "$?" 2 "602-b"
	
	## alpha check 603
	printf  "\n%s\n" "603-a Enter an alphabetical string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	bmtTestFunc "$?" 0 "603-a"

	printf  "\n%s\n" "603-b Enter an NON alphabetical string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	bmtTestFunc "$?" 2 "603-b"
	
	# lowercase 
	printf  "\n%s\n" "604 lowercase test"
	result=$(bmtDataFunc lowercase "TEST")   # or result=`myfunc`
	printf  "%s\n" "$result"
	bmtTestFunc 1 1 "604-a"  "NOAUTO"
	
	#uppercase 
	printf  "\n%s\n" "605 uppercase test"
	result1=$(bmtDataFunc uppercase "test")
	printf  "%s\n" "$result1"
	bmtTestFunc 1 1 "605-a"  "NOAUTO"
	
	# trim 
	printf  "\n%s\n" "606 trim test"
	mytrim="       test   "
	result2=$(bmtDataFunc trim "$mytrim")
	printf  "%s\n" "$result2"
	bmtTestFunc 1 1 "606-a"  "NOAUTO"

	# string length 
	printf  "\n%s\n" "607 string length test"
	bmtDataFunc strlen "test string 123" # 15
	bmtTestFunc "$?" 15 "607-a"
	bmtDataFunc strlen "" #report 250 error
	bmtTestFunc "$?" 250 "607-b"
}

Test_Func
# === END ===
