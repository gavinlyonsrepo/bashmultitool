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
	bmtNetworkFunc foo
	echo " "
	
	# 301 checknet
	echo " "
	echo "Test 301 "
	bmtNetworkFunc checknet "www.fgndoignd.ie"
	bmtNetworkFunc checknet "www.bdbgbgbfg.ie"
	echo " "
	bmtNetworkFunc checknet "www.boards.ie"
	bmtNetworkFunc checknet "www.google.ie"
	echo " "

	# 302
	echo "Test 302 "
	bmtNetworkFunc weather Cork 4 
}

Test_Func

# === END ===
