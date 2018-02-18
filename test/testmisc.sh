#!/bin/bash

#=========================HEADER==========================================
#name: testMisc.sh
#Description: test file for bashmultitool bmtMisc
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
	# error handling check(catch typos)
	echo "error handling"
	bmtMiscFunc
	bmtMiscFunc foo

	# call spinner function put run in background and save PID
	echo " "
	bmtMiscFunc  spin &
	pid=$!
	disown
	echo "START"
	find ~ -name mint 2>/dev/null 'do stuff'
	echo " "
	echo "END"
	# Stop spin function with PID
	kill $pid 
	sleep 2
	echo " "

	# checknet
	echo " "
	bmtMiscFunc checknet "www.fgndoignd.ie"
	bmtMiscFunc checknet "www.bdbgbgbfg.ie"
	echo " "
	bmtMiscFunc checknet "www.boards.ie"
	bmtMiscFunc checknet "www.google.ie"
	echo " "
}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
