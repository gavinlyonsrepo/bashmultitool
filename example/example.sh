#!/bin/bash

#==HEADER==

#name: Gavin Lyons
#Title : Bashmultitool
#Description: A Bash Shell library for commonly used functions 
# can be imported into shell scripts to create functional and colorful 
# scripts and Terminal users interfaces(TUI). This file is placeholder
# for library with meta data 
#URL: https://github.com/gavinlyonsrepo/bashmultitool

LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done

# === GLOBAL VARIABLES SETUP ===

# === FUNCTIONS===
#FUNCTION HEADER
# NAME : 
# DESCRIPTION :   
# INPUTS : 
# PROCESS :
# OUTPUT :
# NOTES:    
function Display_Func
{
	bmtMiscFunc title 3 2 '#' "Bashmultitool library Demo"
	bmtMiscFunc drawbox 3 2 "A file to demo bash library" "Written by Gavin Lyons "
	bmtPromptFunc anykey "and download files " b_cyan
	bmtPromptFunc eventstatus "File 1 Download" "OK" b_green
	bmtPromptFunc eventstatus "File 2 Download" "Fail" b_red
	bmtPromptFunc eventstatus "File 3 Download" "Fail" b_red
	bmtPrintFunc  b_cyan  "Do you want to Log error? [y/n/q] :"
	bmtPromptFunc yesnoquit b_yellow
	case $? in
		0)  
			bmtPrintFunc b_red
			bmtLinuxFunc log "NOTICE" "File 2 failed"  mylog /tmp/ "MES"
			bmtLinuxFunc log "NOTICE" "File 3 failed"  mylog /tmp/ "MES"
		;;
		2) bmtPrintFunc norm "No logging done!" ;;
		3) exit 1;;
	esac
	bmtPrintFunc  b_cyan  "Do you want to Upload log file ? [y/n/q] :"
	bmtPromptFunc yesnoquit b_yellow
	case $? in
		0)  
				bmtPrintFunc  b_green  "Uploading Log file"
				bmtTimeFunc  progressbar 1 &
				pid=$!
				disown
				sleep 25 #do stuff
				echo " "
				bmtPromptFunc eventstatus "Log File uploaded" "OK" b_green
				# Stop spin function with PID
				kill $pid
		;;
		2) : ;;
		3) exit 1;;
	esac
	bmtPromptFunc anykey "to exit" b_cyan 
}

#=== MAIN CODE ===
clear
Display_Func
# === END ===
