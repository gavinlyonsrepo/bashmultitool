#!/bin/bash

#=========================HEADER==========================================
#name: testfile.sh
#Description: test file for bashmultitool library , bmtFiles file
#Written : Gavin Lyons

#====================FUNCTIONS===============================
#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
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

# 'dir empty '
echo "DIREMPTY"
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/empty/"
echo $?
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/file/"
echo $?
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/dir/"
echo $?
bmtFilesFunc isdirempty "/foo/foo"
echo $?
echo " "

#make dir
echo "MAKE DIR "            
bmtFilesFunc makedir "/tmp/" "-TEST"
echo $?
bmtFilesFunc makedir "/foo/" "-foo"
echo $?
echo " "

# dir exists
echo "DIR exist " 
bmtFilesFunc directoryexists /tmp/foo
echo $?
bmtFilesFunc directoryexists /tmp/
echo $?
echo " "

#file exists
echo "file exist " 
bmtFilesFunc fileexists /tmp/foo
echo $?
bmtFilesFunc fileexists /tmp/temp
echo $?
echo " "


#device exists
echo "device exist " 
bmtFilesFunc deviceexists /dev/sdf
echo $?
bmtFilesFunc deviceexists /dev/sda
echo $?
echo " "
}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
