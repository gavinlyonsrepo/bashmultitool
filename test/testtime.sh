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
	printf  "%s\n"  "Error handling"
	bmtTimeFunc
	bmtTestFunc "$?" 255 "70E-a"
	bmtTimeFunc foo
	bmtTestFunc "$?" 255 "70E-b"
	
	# 701 , prints 1651084921
	printf  "\n%s\n" "701-a Convert time to  epoch time ::"
	bmtTimeFunc epochconvert "2022-04-27 19:42:01 "
	printf  "%s\n"  " Pass :: 1651084921"
	bmtTestFunc 1 1 "701-a" "NOAUTO"

	# 702
	printf  "\n%s\n"  "702-b Current time Stamp ::"
	bmtTimeFunc epochnow
	echo
	bmtTestFunc 1 1 "702-b" "NOAUTO"
	
	# 703 call spinner function put run in background and save PID
	printf  "\n%s\n" "Test 703-a  spinner"
	
	bmtTimeFunc  spin &
	pid=$!
	disown
	
	sleep 10 # Do stuff here 
	
	kill $pid 	# Stop spin function with PID
	sleep 1
	echo 
	bmtTestFunc 1 1 "703-a" "NOAUTO"

	# 704-707
	printf  "\n%s\n" "Test 704-707 Stopwatch timer"
	bmtTimeFunc startWatch
	sleep .100
	bmtTimeFunc stopWatch
	echo " 0.1 S"
	
	bmtTimeFunc startWatch
	sleep 1
	bmtTimeFunc stopWatch
	echo " 1.0 S"

	bmtTimeFunc startWatch
	sleep 4.8
	bmtTimeFunc stopWatch
	echo " 4.8 S"
	bmtTestFunc 1 1 "704-a" "NOAUTO"
	
	# 708 call progressbar function put run in background and save PID

	printf  "\n%s\n" "Test 708 progress bar "
	bmtTimeFunc  progressbar 1 &
	pid=$!
	disown
	sleep 25 #do stuff
	kill $pid 	# Stop spin function with PID
	sleep 1
	echo
	bmtTestFunc 1 1 "708-a" "NOAUTO"
	
	#709 
	printf  "\n%s\n" "Test 709 "
	bmtTimeFunc dateformat "1651084921" 
	printf  "\n%s\n" " Pass :: 2022-04-27 19:42:01"

	bmtTimeFunc dateformat "1651084921" "%FT%T%z"
	printf  "\n%s\n" " Pass :: 2022-04-27T19:42:01+0100"
	
	bmtTestFunc 1 1 "709-a" "NOAUTO"

	#701 702 & 709 combined
	local timeVar2
	local timeVar
	printf  "\n%s\n" " Test 70X-a 701 702 and  709 combined"
	timeVar="$(bmtTimeFunc epochnow)"  # get current time in epoch seconds
	printf  "%s\n" "Epoch time in :: $timeVar"
	timeVar2="$(bmtTimeFunc dateformat "$timeVar")" # Convert that to a date time
	printf  "%s\n%s" "Time converted :: $timeVar2" "Epoch Time Out :: "
	bmtTimeFunc epochconvert "$timeVar2" #  Convert back to epoch
	echo
	bmtTestFunc 1 1 "70X-a" "NOAUTO"
}

# === MAIN CODE ===
Test_Func
# === END ===
