#!/bin/bash

#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#name: testfile.sh
#Description: test file for bashmultitool library , bmtFiles file
#Written : Gavin Lyons

# === FUNCTIONS ===
#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done

TESTOBJECTS="$HOME/Documents/Tech/Scripts/BashMultiTool/test/testObjects"

function Test_Func
{

#check for bad user input
echo "Keyword error handling"
bmtFilesFunc foo
echo " "

#make dir
echo "MAKE DIR Test 501"            
bmtFilesFunc makedir "/tmp/" "-TEST"
echo $?
bmtFilesFunc makedir "/foo/" "-foo"
echo $?
echo " "

# 'dir empty '
echo "DIR EMPTY Test 502"
bmtFilesFunc isdirempty "$TESTOBJECTS/EmptyDir/"
echo $?
bmtFilesFunc isdirempty "$TESTOBJECTS/NonEmptyDir/"
echo $?
bmtFilesFunc isdirempty "/foo/foo"
echo $?
echo " "



# dir exists
echo "DIR exist 503" 
bmtFilesFunc directoryexists /tmp/
echo $?
bmtFilesFunc directoryexists /tmp/foo
echo $?
echo " "

# File exists
echo "File exist 504" 
bmtFilesFunc fileexists "$TESTOBJECTS/full.txt"
echo $?
bmtFilesFunc fileexists /tmp/foo.txt
echo $?
echo " "


# Device exists
echo "device exist 505" 
bmtFilesFunc deviceexists /dev/sda
echo $?
bmtFilesFunc deviceexists /dev/sdf
echo $?
echo " "

# File empty
echo "file empty 506"
bmtFilesFunc isfileempty "$TESTOBJECTS/full.txt"
echo $?
bmtFilesFunc isfileempty "$TESTOBJECTS/empty.txt"
echo $?
echo " "

# Get file size 
echo "getfilesize 507"
bmtFilesFunc getfilesize "$TESTOBJECTS/tv.png"
echo $?
bmtFilesFunc getfilesize "/foo/foo.txt"
echo $?
echo " "

echo "getfilesizebytes 508"
bmtFilesFunc getfilesizebytes "$TESTOBJECTS/tv.png"
echo $?
bmtFilesFunc getfilesizebytes "/foo/foo.txt"
echo $?
echo " "

echo "Get mime type of provided input 509"
# print to console
bmtFilesFunc getmimetype "$TESTOBJECTS/tv.png"
echo $?
echo " "

#  print to echo and send to a file
echo "$(bmtFilesFunc getmimetype "$TESTOBJECTS/full.txt")" >> /tmp/mytempfile123.txt
echo $?
echo " "

# print to console
bmtFilesFunc getmimetype "foo/foo/tv.png"
echo $?
echo " "
}

Test_Func
# === END ===
