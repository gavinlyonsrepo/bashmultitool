#!/bin/bash

#=========================HEADER==========================================
#name: testprompt.sh
#Description: test file for bashmultitool, file bmtPrompt
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

	#error handling check(catch typos)
	echo "error handling"
	bmtPromptFunc foo
	
	#draw a line 1
	echo " "
	bmtPromptFunc line    "=" 
	bmtPromptFunc line    "8" 
	echo " "
	
	#anykey prompt 2
	bmtPromptFunc anykey
	bmtPromptFunc anykey " and go on to next step"
	
	#yesnoquit 3
	echo "yesnoquit"
	echo "What do you want to do?"
	echo "[y/n/q] :-"
	bmtPromptFunc yesnoquit
		case $? in
		0)
			echo "yes"
		;;
		2)
			echo "no"
		;;
		3)
			echo "quit"
		;;
		*)
			echo "Unknown output"
		;;
		esac
		
	echo " "
	#yesno 4a lowercase y,  return 0 for yes
	echo "yesno"
	echo "What do you want to do?"
	echo "[y/N] :-"
	bmtPromptFunc yesno yes
		case $? in
		0)
			echo "yes"
		;;
		2)
			echo "no"
		;;
		128)
			echo "Bad user option"
		;;
		esac
	echo " "
	#yesno 4b  lowercase n,  return 0 for no
	echo "yesno"
	echo "What do you want to do?"
	echo "[Y/n] :-"
	bmtPromptFunc yesno no
		case $? in
		0)
			echo "no"
		;;
		2)
			echo "yes"
		;;
		128)
			echo "Bad user option"
		;;
		esac
	#user type catch
	echo " "
	echo "catch user type keyword"
	bmtPromptFunc yesno foo
	echo $?
	
}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
