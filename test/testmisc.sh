#!/bin/bash

#=========================HEADER==========================================
#name: testMisc.sh
#Description: test file for bashmultitool bmtMisc
#Written : Gavin Lyons

#====================FUNCTIONS===============================
#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
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

	# 1 call spinner function put run in background and save PID
	echo " "
	bmtMiscFunc  spin &
	pid=$!
	disown
	echo "START"
	find ~ -name mint 2>/dev/null 'do stuff'
	echo " "
	echo "END"
	# 2 Stop spin function with PID
	kill $pid 
	sleep 2
	echo " "

	# 3 checknet
	echo " "
	bmtMiscFunc checknet "www.fgndoignd.ie"
	bmtMiscFunc checknet "www.bdbgbgbfg.ie"
	echo " "
	bmtMiscFunc checknet "www.boards.ie"
	bmtMiscFunc checknet "www.google.ie"
	echo " "
	
	#4 5 6 
	bmtMiscFunc startWatch
	sleep .100
	bmtMiscFunc stopWatch
	
	bmtMiscFunc startWatch
	sleep 1
	bmtMiscFunc stopWatch
	
	bmtMiscFunc startWatch
	sleep 2.8
	bmtMiscFunc stopWatch
	
	# 7
	bmtMiscFunc weather
}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
