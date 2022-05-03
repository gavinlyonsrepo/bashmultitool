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
	bmtTestFunc "$?" 255 "40E-a"
	bmtLinuxFunc foo
	bmtTestFunc "$?" 255 "40E-b"

	# checkpac
	printf "\n%s\n" "check packages 401"
	bmtLinuxFunc checkpac "cylondeb"  2  #installed package
	bmtTestFunc "$?" 0 "401-a"
	bmtLinuxFunc checkpac "foooodds" 2  #non installed package 
	bmtTestFunc "$?" 2 "401-b"
	
	bmtLinuxFunc checkpac "cylondeb"  2  "MES" #installed package
	bmtTestFunc "$?" 0 "401-c"
	bmtLinuxFunc checkpac "fooigkfnmgi"  2  "MES" #non installed package 
	bmtTestFunc "$?" 2 "401-d"

	
	# distrocheck
	printf "\n%s\n" " check distro 402"
	echo "my distro is :-"
	bmtLinuxFunc distrocheck
	bmtTestFunc "$?" 4 "402-a"
	
	
	# env text editor check
	echo 
	printf "\n%s\n" "Is text editor set? 403"
	echo "$EDITOR"
	bmtLinuxFunc isTextEdSet
	echo "$?"
	echo "$EDITOR"
	bmtTestFunc 1 1 "403-a" "NOAUTO"
	
	# logfile
	printf "\n%s\n" "logfile 404"
	# error handing non valid label test 
	bmtLinuxFunc log "non valid label test " "overflow" mylog /tmp/
	bmtTestFunc "$?" 55 "404-a" 
	echo

	# section subsection
	bmtLinuxFunc log "WARNING" "overflow"  mylog /tmp/
	bmtTestFunc "$?" 0 "404-b"
	bmtLinuxFunc log "INFO" "my message"  mylog /tmp/
	bmtTestFunc "$?" 0 "404-c"  
	bmtPrintFunc b_red
	bmtLinuxFunc log "NOTICE" "my notice"  mylog /tmp/ "MES"
	bmtTestFunc "$?" 0 "404-d" 
	bmtPrintFunc norm
	bmtTestFunc 1 1 "404-e" "NOAUTO"
	
	#  if user exists on the system
	printf "\n%s\n" "user check 405"
	bmtLinuxFunc user "gavin"
	bmtTestFunc "$?" 0 "405-a" 
	bmtLinuxFunc user "foo12323"
	bmtTestFunc "$?" 2 "405-b" 


	# check if varible set and empty
	printf "\n%s\n" "Variable check 406"
	local varsetfull="foo"
	local varsetempty=""
	
	bmtLinuxFunc isvarempty varsetfull
	bmtTestFunc "$?" 0 "406-a" 
	bmtLinuxFunc isvarempty varsetempty
	bmtTestFunc "$?" 2 "406-b" 
	bmtLinuxFunc isvarempty foofoo
	bmtTestFunc "$?" 3 "406-c" 
	
	printf "\n%s\n" "Root running check 407"
	bmtLinuxFunc runasroot
	bmtTestFunc "$?" 2 "407-a" 
	
	printf "\n%s\n"  "Is command  check 408"
	bmtLinuxFunc iscommand tput
	bmtTestFunc "$?" 0 "408-a" 
	bmtLinuxFunc iscommand foofoo
	bmtTestFunc "$?" 2 "408-b" 
}

Test_Func
# === END ===
