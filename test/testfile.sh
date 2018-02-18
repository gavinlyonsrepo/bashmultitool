#!/bin/bash

#=========================HEADER==========================================
#name: testfile.sh
#Description: test file for bashmultitool library , bmtFiles file
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
error " keyword error handling"
bmtLinuxFunc foo

echo " "

bmtFilesFunc isdirempty "$HOME/Desktop/TEST/empty/"
echo $?
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/file/"
echo $?
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/dir/"
echo $?
bmtFilesFunc isdirempty "/foo/foo"
echo $?
echo " "
            
bmtFilesFunc makedir "/tmp/" "-TEST"
echo $?
bmtFilesFunc makedir "/foo/" "-foo"
echo $?

}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
