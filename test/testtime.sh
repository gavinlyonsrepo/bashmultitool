#!/bin/bash
#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#name: testtime.sh
#Description: test file for bashmultitool bmtTime
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
	# error handling check(catch typos)
	echo "Error handling"
	bmtTimeFunc
	bmtTimeFunc foo
	echo " "
	
	# 701
	echo "Test 701 "
	echo "Convert time to  epoch time ::"
	bmtTimeFunc epochconvert "2022-04-27 19:42:01 "
	# prints 1651084921
	echo " "
	# 702
	echo "Test 702 "
	echo "Current time Stamp ::"
	bmtTimeFunc epochnow
	echo " "
	
	# 703 call spinner function put run in background and save PID
	echo " "
	echo "Test 703 "
	bmtTimeFunc  spin &
	pid=$!
	disown
	echo "START"
	echo " "
	sleep 10 #do stuff
	echo " "
	echo "END"
	# Stop spin function with PID
	kill $pid
	sleep 2
	echo " "

	# 704-707
	echo "Test 704-707"
	bmtTimeFunc startWatch
	sleep .100
	bmtTimeFunc stopWatch
	echo " 0.1 S"
	
	bmtTimeFunc startWatch
	sleep 1
	bmtTimeFunc stopWatch
	echo " 1.0 S"

	bmtTimeFunc startWatch
	sleep 2.8
	bmtTimeFunc stopWatch
	echo " 2.8 S"

	# 708 call progressbar function put run in background and save PID
	echo " "
	echo "Test 708 "
	bmtTimeFunc  progressbar 1 &
	pid=$!
	disown
	echo "START"
	sleep 25 #do stuff
	echo " "
	echo "END"
	# Stop spin function with PID
	kill $pid
	sleep 2
	echo " "
	
	#709 
	echo "Test 709 "
	bmtTimeFunc dateformat "1651084921" 
	echo " "
	# prints ~ 2022-04-27 19:42:01 
	bmtTimeFunc dateformat "1651084921" "%FT%T%z"
	echo " "
	# prints ~ 2022-04-27T19:42:01+0100
}

# === MAIN CODE ===
Test_Func
# === END ===
