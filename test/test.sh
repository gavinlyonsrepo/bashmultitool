#!/bin/bash

#=========================HEADER==========================================
#name: test.sh
#Description: test file for bahsmultitool
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
	#print
	BashMTFunc norm "hello World"
	BashMTFunc highlight "highlight World"
	
	
	BashMTFunc black "black World"
	BashMTFunc red "red World"
	BashMTFunc green "green World"
	BashMTFunc tan "tan World"
	BashMTFunc blue "blue World"
	BashMTFunc purple "purple World"
	BashMTFunc cyan "cyan World"
	BashMTFunc white "white World"
	
	BashMTFunc grey "grey  World"
	BashMTFunc b_red "bright red World"
	BashMTFunc b_green "bright green World"
	BashMTFunc yellow "yellow World"
	BashMTFunc b_blue "bright blue World"
	BashMTFunc b_purple "bright purple World"
	BashMTFunc b_cyan "bright cyan World"
	BashMTFunc b_grey "bright grey World"
	
	#line
	BashMTFunc line    "=" 
	BashMTFunc line    "8" 
	#dir
	BashMTFunc makedir "/tmp/" "-TEST"
	
	#yesno
	BashMTFunc norm  "Do you want to continue?"
	BashMTFunc norm  "[y/n/q] :-"
	BashMTFunc yesno
		case $? in
		0)
			echo "yes"
		;;
		1)
			echo "no"
		;;
		255)
			echo "quit"
		;;
		*)
			echo "Unknown output"
		;;
		esac
		
	BashMTFunc anykey " text here"
	
	# call spinner function put run in background and save PID
	echo " "
	BashMTFunc  spin &
	pid=$!
	
	# do stuff
	find ~ -name mint 2>/dev/null

	# Stop spin function with PID
	kill $pid 

	echo " "
	
	#checkpac
	BashMTFunc  checkpac "cylondeb"  2  
	echo "$?"
	BashMTFunc  checkpac "ddsdds" 2 
	echo "$?"
	
	BashMTFunc  checkpac "igkfnmgi"  2  "MES"
	BashMTFunc  checkpac "cylondeb"  2  "MES"
	BashMTFunc  checkpac "firefox"  2  "MES"
	
	BashMTFunc checknet "www.google.ie"
	BashMTFunc checknet "www.fgndoignd.ie"
	BashMTFunc checknet "www.bdbgbgbfg.ie"
	BashMTFunc checknet "www.boards.ie"
	
	BashMTFunc distrocheck
	echo "$?"
}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
