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
	echo "Error handling:: "
	bmtMiscFunc # No keyword
	bmtTestFunc "$?" 255 "80E-a"
	bmtMiscFunc foo # Wrong keyword
	bmtTestFunc "$?" 255 "80E-a"

	# 801 password generator 
	echo 
	bmtMiscFunc password "/home/gavin/Documents/Tech/Scripts/BashMultiTool/stuff/"
	bmtTestFunc "$?" 0 "801-a"
	echo  
	
	bmtMiscFunc password 
	bmtTestFunc "$?" 0 "801-b"
	echo  
	
	#802 battery level 
	echo "802 test"
	bmtMiscFunc getbatlevel "BAT0" "MES"
	echo "$?"
	bmtTestFunc 1 1 "802-a" "NOAUTO"
	
	bmtMiscFunc getbatlevel "foo" "MES"
	bmtTestFunc "$?" 101 "802-b"
	echo  
	
	#803 
	echo "803 test box"
	# 1 = red,box 2 = green,text "tput setaf  colours"
	bmtMiscFunc drawbox 1 2 'first line' 'second line' 'third line'
	bmtTestFunc 1 1 "803-a" "NOAUTO"
	echo  
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	bmtMiscFunc drawbox 7 6 'hello world' 
	bmtTestFunc 1 1 "803-b" "NOAUTO"
	echo  
	
	#804 
	echo "804 test title"
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	bmtMiscFunc title 7 6   '#' 'hello'
	bmtTestFunc 1 1 "804-a" "NOAUTO"
	echo  
	# 2 = green,box  6= cyan,text "tput setaf  colours"
	bmtMiscFunc title 2 6   '+' 'World bye'
	bmtTestFunc 1 1 "804-b" "NOAUTO"
	echo 
}

Test_Func
bmtTestFunc 1 1 "END"

# === END ===
