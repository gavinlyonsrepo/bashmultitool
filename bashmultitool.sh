#!/bin/bash

#=========================HEADER==================================

#name: Gavin Lyons
#Title : Bashmultitool
#Description: A Bash Shell library for commonly used functions 
# can be imported into shell scripts to create functional and colorful 
# scripts and Terminal users interfaces(TUI). This file is placeholder
# for library with meta data 
#Version : 2.0-1
#License: MIT
#URL: https://github.com/gavinlyonsrepo/bashmultitool

LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done

#====================FUNCTIONS===============================
#FUNCTION HEADER
# NAME : Bmt_Metadata_Func
# DESCRIPTION : Function to display metadata on  Bashmultitool
 
function Bmt_Metadata_Func
{
	bmtPromptFunc line "=" green
	bmtPrintFunc  norm " Title : Bashmultitool"
	bmtPrintFunc  norm " Description : A Bash Shell library file for commonly used functions 
 can be imported into shell scripts to create functional and colorful 
 scripts and Terminal users interfaces(TUI). "
	bmtPrintFunc  norm " Version : 2.0-1 "
	bmtPrintFunc  norm " License: MIT"
	bmtPrintFunc  norm " URL : https://github.com/gavinlyonsrepo/bashmultitool "
	bmtPrintFunc  norm " Path : /usr/lib/bashmultitool"
	bmtPromptFunc line "=" green
}

#==================MAIN CODE==============================
Bmt_Metadata_Func
#====================== END ==============================
