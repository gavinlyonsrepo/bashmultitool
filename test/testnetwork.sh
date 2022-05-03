#!/bin/bash

#shellcheck disable=SC1090 # source "$MYFILE"

#=== HEADER ===
#name: testNetwork.sh
#Description: test file for bashmultitool bmtNetwork

#=== FUNCTIONS === 
#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done


function Test_Func
{
	# error handling check(catch typos)
	echo "Error handling"
	bmtNetworkFunc
	bmtTestFunc "$?" 255 "30E-a"
	bmtNetworkFunc foo
	bmtTestFunc "$?" 255 "30E-b"
	
	# 301 checknet
	echo " "
	echo "Test 301 "
	bmtNetworkFunc checknet "www.fgfoofoondoignd.ie"
	bmtTestFunc "$?" 2 "301-a"
	bmtNetworkFunc checknet "www.google.ie"
	bmtTestFunc "$?" 0 "301-b"

	# 302
	echo "Test 302 "
	bmtNetworkFunc weather Cork 4 
	bmtTestFunc "$?" 0 "302-a"
}

Test_Func

# === END ===
