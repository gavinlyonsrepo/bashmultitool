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
echo "Error handling :"
bmtFilesFunc foo
bmtTestFunc "$?" 255 "50E-a"
bmtFilesFunc
bmtTestFunc "$?" 255 "50E-b"
echo

# 'dir empty '
echo "DIR EMPTY Test 501"
bmtFilesFunc isdirempty "$TESTOBJECTS/EmptyDir/"
bmtTestFunc "$?" 0 "501-a" # empty
bmtFilesFunc isdirempty "$TESTOBJECTS/NonEmptyDir/"
bmtTestFunc "$?" 2 "501-b" # non -empty
bmtFilesFunc isdirempty "/foo/foo" 
bmtTestFunc "$?" 3 "501-c" # does not exist
echo 

#make dir
echo "MAKE DIR Test 502"            
bmtFilesFunc makedir "/tmp/" "-TEST"
bmtTestFunc "$?" 0 "502-a"  # success
bmtFilesFunc makedir "/foo/" "-foo" 
bmtTestFunc "$?" 50 "502-b" # path does not exist
bmtFilesFunc makedir "/usr/" "-iamnotroot" 
bmtTestFunc "$?" 52 "502-c" # Could not make directory , Permissions maybe
echo 

# dir exists
echo "DIR exist 503" 
bmtFilesFunc directoryexists /tmp/
bmtTestFunc "$?" 0 "503-a"  # success
bmtFilesFunc directoryexists /tmp/foo
bmtTestFunc "$?" 2 "503-b"  # fail
echo

# File exists
echo "File exist 504" 
bmtFilesFunc fileexists "$TESTOBJECTS/full.txt"
bmtTestFunc "$?" 0 "504-a"  # success
bmtFilesFunc fileexists /tmp/foo.txt
bmtTestFunc "$?" 2 "504-b"  # fail
echo 


# Device exists
echo "device exist 505" 
bmtFilesFunc deviceexists /dev/sda
bmtTestFunc "$?" 0 "505-a"  # success
bmtFilesFunc deviceexists /dev/sdf
bmtTestFunc "$?" 2 "505-b"  # fail
echo 

# File empty
echo "file empty 506"
bmtFilesFunc isfileempty "$TESTOBJECTS/full.txt"
bmtTestFunc "$?" 0 "506-a"  # success
bmtFilesFunc isfileempty "$TESTOBJECTS/empty.txt"
bmtTestFunc "$?" 2 "506-b"  # fail
echo " "

# Get file size 
echo "getfilesize 507"
bmtFilesFunc getfilesize "$TESTOBJECTS/tv.png"
bmtTestFunc "$?" 0 "507-a"  # success
bmtTestFunc 1 1 "507-b"  "NOAUTO"
bmtFilesFunc getfilesize "/foo/foo.txt"
bmtTestFunc "$?" 2 "507-c"  # fail
echo 

echo "getfilesizebytes 508"
bmtFilesFunc getfilesizebytes "$TESTOBJECTS/tv.png"
bmtTestFunc "$?" 0 "508-a"  # success
bmtTestFunc 1 1 "508-b"  "NOAUTO"
bmtFilesFunc getfilesizebytes "/foo/foo.txt"
bmtTestFunc "$?" 2 "508-c"  # fail
echo 

echo "Get mime type of provided input 509"
# print to console
bmtFilesFunc getmimetype "$TESTOBJECTS/tv.png"
echo 
bmtTestFunc 1 1 "509-a"  "NOAUTO"
echo 

#   send to a file
bmtFilesFunc getmimetype "$TESTOBJECTS/full.txt" >> /tmp/mytempfile123.txt
echo  " /tmp/mytempfile123.txt file created"
bmtTestFunc 1 1 "509-b"  "NOAUTO"

bmtFilesFunc getmimetype "/foo/foo/tv.png"
bmtTestFunc "$?" 4 "509-c"  # file does not exit

}

Test_Func
# === END ===
