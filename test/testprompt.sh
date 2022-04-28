#!/bin/bash
#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#name: testprompt.sh
#Description: test file for bashmultitool, file bmtPrompt
#Written : Gavin Lyons

# === FUNCTIONS ===
#Source the lib, note local path.
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done


function Test_Func
{
	#error handling check(catch user typos)
	echo "Error handling"
	bmtPromptFunc foo
	echo $?
	echo " "
	
	#draw a line 201
	echo "Test 201  "
	bmtPromptFunc line    "="  red
	echo "my text here"
	bmtPromptFunc line    "8" 
	echo "my text here"
	echo " "
	bmtPromptFunc line    "="  green
	bmtPromptFunc line    "="  green
	echo " "
	
	#yesnoquit 202
	echo "Test 202  "
	echo "yesnoquit"
	echo "What do you want to do?"
	echo "[y/n/q] :-"
	bmtPromptFunc yesnoquit b_yellow
		case $? in
			0) echo "0 yes" ;;
			2) echo "2 no" ;;
			3) echo "3 quit" ;;
			*) echo "Unknown output" ;;
		esac
		
	echo " "
	
	#yesno 203 lowercase y,  return 0 for yes
	echo "Test 203  "
	echo "yesn yes"
	echo "What do you want to do?"
	echo "[y/N] :-"
	bmtPromptFunc yesno yes
	case $? in
		0) echo "0 yes" ;;
		2) echo "2 no" ;;
		50) echo "50 Bad user option" ;;
	esac
	echo " "
	
	#yesno 204  lowercase n,  return 0 for no
	echo "Test 204"
	echo "yesno no"
	echo "What do you want to do?"
	echo "[Y/n] :-"
	bmtPromptFunc yesno no
	case $? in
		0)  echo "0 no" ;;
		2) echo "2 yes" ;;
		50) echo "50 Bad user option" ;;
	esac
	echo " "
	
	# user type catch 203 & 204
	echo " "
	echo "catch user type keyword for test 203 & 204"
	bmtPromptFunc yesno foo
	echo $?
	echo " "
	
	# anykey prompt 205
	echo "Test 205 anykey"
	bmtPromptFunc anykey "" u_green
	echo "my text here"
	bmtPromptFunc anykey " and go on to next step"
	echo "my text here"
	echo " "
	
	# quitno 206 lowercase q,  return 0 for quit
	echo "Test 206"
	echo "quitno quit"
	echo "What do you want to do?"
	echo "[q/N] :-"
	bmtPromptFunc quitno quit
	case $? in
		0) echo "0 quit" ;;
		2) echo "2 no" ;;
		50) echo "50 Bad user option" ;;
	esac
	echo " "
	
	#quitno 207  lowercase n,  return 0 for no
	echo "Test 207"
	echo "quitno no"
	echo "What do you want to do?"
	echo "[Q/n] :-"
	bmtPromptFunc quitno no
	case $? in
		0) echo "0 no" ;;
		2) echo "2 quit" ;;
		50) echo "50 Bad user option" ;;
	esac
	echo " "
		
	
	#208 
	echo "Test 208"
	bmtPromptFunc wishtocontinue "Do you wish to contine?" b_yellow
	#bmtPromptFunc wishtocontinue "Do you wish to contine?" 
	echo "Continued "
	echo " "
	
	#209
	echo "Test 209 center text"
	bmtPromptFunc centertext "Hello World." 
	echo 
	
	#210
	echo "Test 210 event status"
	bmtPromptFunc eventstatus "Installing bashMultiTool" "OK" b_green
	bmtPromptFunc eventstatus "File upload" "Fail" b_red
	bmtPromptFunc eventstatus "File upload" "Pending" 
	echo
	
}

Test_Func
# === END ===
