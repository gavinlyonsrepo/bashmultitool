#!/bin/bash

#=========================HEADER==========================================
#name: testLinux.sh
#Description: test file for bashmultitool , bmtLinux
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
	#check for bad user input
	bmtLinuxFunc foo
	
	# checkpac
	echo "check packages"
	bmtLinuxFunc checkpac "cylondeb"  2  
	echo "$?"
	bmtLinuxFunc checkpac "ddsdds" 2 
	echo "$?"
	
	bmtLinuxFunc checkpac "igkfnmgi"  2  "MES"
	bmtLinuxFunc checkpac "cylondeb"  2  "MES"
	bmtLinuxFunc checkpac "firefox"  2  "MES"
	
	# distrocheck
	echo " "
	echo "my distro is :-"
	bmtLinuxFunc distrocheck
	echo "$?"
	
	
	# env text editor check
	echo " "
	echo "is text editor set?"
	echo $EDITOR
	bmtLinuxFunc isTextEdSet
	echo "$?"
	echo " "
	
	# logfile
	echo "logfile"
	bmtLinuxFunc log 342  "overflow" mylog /tmp/
	bmtLinuxFunc log "WARNING" "overflow"  mylog /tmp/
	bmtLinuxFunc log "INFO" "my measseg"  mylog /tmp/

}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
