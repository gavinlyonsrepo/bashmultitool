#!/bin/bash

#shellcheck disable=SC1090 # source "$MYFILE"

#=== HEADER ===
#name: testMisc.sh
#Description: test file for bashmultitool bmtMisc

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
	bmtMiscFunc
	bmtMiscFunc foo
	echo "$?"

	# 801 password generator 
	echo " " 
	echo "801 test"
	bmtMiscFunc password "/home/gavin/Documents/Tech/Scripts/BashMultiTool/stuff/"
	echo "$?"
	echo " " 
	
	bmtMiscFunc password 
	echo "$?"
	echo " " 
	
	#802 battery level 
	echo "802 test"
	bmtMiscFunc getbatlevel "BAT0" "MES"
	echo "$?"
	echo " " 
	
	bmtMiscFunc getbatlevel "foo" "MES"
	echo "$?"
	echo " " 
	
	#803 
	echo "803 test box"
	# 1 = red,box 2 = green,text "tput setaf  colours"
	bmtMiscFunc drawbox 1 2 'first line' 'second line' 'third line'
	echo " " 
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	bmtMiscFunc drawbox 7 6 'hello world' 
	echo " " 
	
	#804 
	echo "804 test title"
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	bmtMiscFunc title 7 6   '#' 'hello'
	echo " " 
	# 2 = green,box  6= cyan,text "tput setaf  colours"
	bmtMiscFunc title 2 6   '+' 'World bye'
	echo "end of tests"
}

Test_Func

# === END ===
