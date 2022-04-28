#!/bin/bash

#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#name: testLinux.sh
#Description: test file for bashmultitool , bmtLinux
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
	#check for bad user input
	bmtLinuxFunc foo
	echo " "
	
	# checkpac
	echo "check packages 401"
	bmtLinuxFunc checkpac "cylondeb"  2  
	echo "$?"
	bmtLinuxFunc checkpac "ddsdds" 2 
	echo "$?"
	
	bmtLinuxFunc checkpac "igkfnmgi"  2  "MES"
	bmtLinuxFunc checkpac "cylondeb"  2  "MES"
	bmtLinuxFunc checkpac "firefox"  2  "MES"
	
	# distrocheck
	echo " "
	echo "check distro 402"
	echo "my distro is :-"
	bmtLinuxFunc distrocheck
	echo "$?"
	
	
	# env text editor check
	echo " "
	echo "is text editor set? 403"
	echo "$EDITOR"
	bmtLinuxFunc isTextEdSet
	echo "$?"
	echo " "
	
	# logfile
	echo "logfile 404"
	# error handing non valid label test 
	bmtLinuxFunc log "non valid label test " "overflow" mylog /tmp/
	echo "$?" 
	echo " "

	# section subsection
	bmtLinuxFunc log "WARNING" "overflow"  mylog /tmp/
	echo "$?" 
	bmtLinuxFunc log "INFO" "my message"  mylog /tmp/
	echo "$?" 
	bmtPrintFunc b_red
	bmtLinuxFunc log "NOTICE" "my notice"  mylog /tmp/ "MES"
	bmtPrintFunc norm
	echo "$?" 
	echo " "
	bmtPrintFunc norm

	#  if user exists on the system
	echo "user check 405"
	bmtLinuxFunc user "gavin"
	echo "$?"
	bmtLinuxFunc user "foo12323"
	echo "$?"
	echo " "

	# check if varible set and empty
	echo "Variable check 406"
	local varsetfull="foo"
	local varsetempty=""
	
	bmtLinuxFunc isvarempty varsetfull
	echo "$?"
	bmtLinuxFunc isvarempty varsetempty
	echo "$?"
	bmtLinuxFunc isvarempty foofoo
	echo "$?"
	echo " "
	
	echo "Root running check 407"
	bmtLinuxFunc runasroot
	echo "$?"
	echo " "
	
	echo "Is command  check 408"
	bmtLinuxFunc iscommand tput
	echo "$?"
	bmtLinuxFunc iscommand foofoo
	echo "$?"
}

Test_Func
# === END ===
