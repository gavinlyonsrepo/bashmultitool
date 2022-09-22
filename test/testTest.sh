#!/bin/bash
#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#Name: testTest.sh
#Description: File to run Automatic tests on library bashmultitool
#URL: https://github.com/gavinlyonsrepo/BashMultiTool

# === FUNCTIONS ===

function testprintFunc
{
printf "%s\n"  "=== Start Print Tests === "  # Section 1
#error handling check(catch typos) 10E
echo  "Error handling"
bmtPrintFunc 
bmtTestFunc "$?" 255 "10E-a"
bmtPrintFunc foofoo
bmtTestFunc "$?" 255 "10E-b"

#print text
	     
	#reg 1
	echo
	bmtPrintFunc norm "reg colours"
	echo
	bmtPrintFunc black "black"
	bmtPrintFunc red "red "
	bmtPrintFunc green "green "
	bmtPrintFunc yellow "yellow" #tan
	bmtPrintFunc blue "blue "
	bmtPrintFunc purple "purple "
	bmtPrintFunc cyan "cyan "
	bmtPrintFunc white "white  " #light grey
	
	#bold 2
	echo
	bmtPrintFunc norm "bold colours"
	echo
	bmtPrintFunc b_black "bold black " #dark grey
	bmtPrintFunc b_red "bold red  "
	bmtPrintFunc b_green "bold green  "
	bmtPrintFunc b_yellow "bold yellow  "
	bmtPrintFunc b_blue "bold blue  "
	bmtPrintFunc b_purple "bold purple  "
	bmtPrintFunc b_cyan "bold cyan  "
	bmtPrintFunc b_white "bold white  "
	
	# underline 3
	echo
	bmtPrintFunc norm "underline colours"
	echo
	bmtPrintFunc u_black "underline black "
	bmtPrintFunc u_red "underline red"
	bmtPrintFunc u_green "underline green  "
	bmtPrintFunc u_yellow "underline yellow  "
	bmtPrintFunc u_blue "underline blue  "
	bmtPrintFunc u_purple "underline purple  "
	bmtPrintFunc u_cyan "underline cyan  "
	bmtPrintFunc u_white "underline white  "

	# background  4
	echo
	bmtPrintFunc norm "background colours"
	echo
	bmtPrintFunc bg_black "background black "
	bmtPrintFunc bg_red "background red  "
	bmtPrintFunc bg_green "background green  "
	bmtPrintFunc bg_yellow "background yellow  "
	bmtPrintFunc bg_blue "background blue  "
	bmtPrintFunc bg_purple "background purple  "
	bmtPrintFunc bg_cyan "background cyan  "
	bmtPrintFunc bg_white "background white  " #very light grey
			
	# high intensity bold 5
	echo
	bmtPrintFunc norm "high intensity  colours"
	echo
	bmtPrintFunc i_black "high intensity black " #very dark grey
	bmtPrintFunc i_red "high intensity  red  "
	bmtPrintFunc i_green "high intensity  green  "
	bmtPrintFunc i_yellow "high intensity  yellow  "
	bmtPrintFunc i_blue "high intensity blue  "
	bmtPrintFunc i_purple "high intensity purple  "
	bmtPrintFunc i_cyan "high intensity cyan  "
	bmtPrintFunc i_white "high intensity white  "
	
	# high intensity bold 6
	echo
	bmtPrintFunc norm "high intensity bold  colours"
	echo
	bmtPrintFunc bh_black "high intensity bold black " #very dark grey
	bmtPrintFunc bh_red "high intensity bold red  "
	bmtPrintFunc bh_green "high intensity bold green  "
	bmtPrintFunc bh_yellow "high intensity bold yellow  "
	bmtPrintFunc bh_blue "high intensity bold blue  "
	bmtPrintFunc bh_purple "high intensity bold purple  "
	bmtPrintFunc bh_cyan "high intensity bold cyan  "
	bmtPrintFunc bh_white "high intensity bold white  "
	
	# high intensity bold 7
	echo
	bmtPrintFunc norm "high intensity background colours"
	echo
	bmtPrintFunc hbg_black "high intensity background black " #light grey
	bmtPrintFunc hbg_red "high intensity background red  "
	bmtPrintFunc hbg_green "high intensity background green  "
	bmtPrintFunc hbg_yellow "high intensity background yellow  "
	bmtPrintFunc hbg_blue "high intensity background blue  "
	bmtPrintFunc hbg_purple "high intensity background purple  "
	bmtPrintFunc hbg_cyan "high intensity background cyan  "
	bmtPrintFunc hbg_white "high intensity background white  " # very light grey
	bmtTestFunc 1 1 "101-a" "NOAUTO"
}

function testpromptFunc
{
	printf "%s\n"  "=== Start Prompt Tests === "  # Section 2
	#error handling check(catch user typos)
	echo "Error handling :: "
	bmtPromptFunc 
	bmtTestFunc "$?" 255 "20E-a"
	bmtPromptFunc foo
	bmtTestFunc "$?" 255 "20E-b"
	
	#draw a line 201
	printf  "\n%s\n"  "Test 201 :: Draw Line  "
	bmtPromptFunc line    "="  red
	printf  "%s\n" "Before Line"
	bmtPromptFunc line    "+" 
	printf  "%s\n\n" "After line"
	
	bmtPromptFunc line    "="  green
	bmtPromptFunc line    "#"  b_cyan
	bmtTestFunc 1 1 "201-a" "NOAUTO"
	
	# Associate key value array' to hold expected prompt return values
	declare -A resArr res1Arr res2Arr res3Arr res4Arr
	local key

	# yesnoquit 202
	resArr+=( ["y"]=0 ["n"]=2 ["q"]=3) 
	printf  "%s\n" "Test 202  :: yesnoquit"
	for key in "${!resArr[@]}"; do
		printf  "%s\n" "press ${key}  [y/n/q] :-" 
		bmtPromptFunc yesnoquit b_yellow
		bmtTestFunc "$?" "${resArr[${key}]}"  "202-${key}"
	done

	# yesno yes 203 [ y/N],  return 0 for yes
	#  'a' here represents "any other key"
	res1Arr+=( ["y"]=0 ["n"]=2 ["a"]=2 ) 
	printf  "\n%s\n" "Test 203  :: yesno yes"
	for key in "${!res1Arr[@]}"; do
		printf  "%s\n" "press ${key}  [y/N] :-" 
		bmtPromptFunc yesno yes
		bmtTestFunc "$?" "${res1Arr[${key}]}"  "203-${key}"
	done

	# yesno no 204  [Y/n],  return 0 for no
	#  'a' here represents "any other key"
	res2Arr+=( ["y"]=2 ["n"]=0 ["a"]=2 ) 
	printf  "\n%s\n" "Test 204  :: yesno no"
	for key in "${!res2Arr[@]}"; do
		printf  "%s\n" "press ${key}  [Y/n] :-" 
		bmtPromptFunc yesno no
		bmtTestFunc "$?" "${res2Arr[${key}]}"  "204-${key}"
	done
	
	# user type catch 203 & 204
	printf  "\n%s\n" "catch user type keyword for test 203 & 204"
	bmtPromptFunc yesno foofoo
	bmtTestFunc "$?" 51  "204-d"
	
	# anykey prompt 205
	printf  "\n%s\n" "Test 205-a  anykey test "
	bmtPromptFunc anykey "" u_green
	echo "my text here"
	bmtPromptFunc anykey " and go on to next step"
	echo "my text here"
	bmtTestFunc 1 1 "205-a" "NOAUTO"
	
	# quitno quit 206 [ q/N],  return 0 for quit
	#  'a' here represents "any other key"
	res3Arr+=( ["q"]=0 ["n"]=2 ["a"]=2 ) 
	printf  "\n%s\n" "Test 206  :: quitno quit"
	for key in "${!res3Arr[@]}"; do
		printf  "%s\n" "press ${key}  [q/N] :-" 
		bmtPromptFunc quitno quit
		bmtTestFunc "$?" "${res3Arr[${key}]}"  "206-${key}"
	done
	
	#quitno no 207  [Q/n] :  return 0 for no
	#  'a' here represents "any other key"
	res4Arr+=( ["q"]=2 ["n"]=0 ["a"]=2 ) 
	printf  "\n%s\n" "Test 207  :: quitno no"
	for key in "${!res4Arr[@]}"; do
		printf  "%s\n" "press ${key}  [Q/n] :-" 
		bmtPromptFunc quitno no
		bmtTestFunc "$?" "${res4Arr[${key}]}"  "207-${key}"
	done
	
	# user type catch 206 & 207
	printf  "\n%s\n" "Catch user type keyword for test 206 & 207"
	bmtPromptFunc quitno foofoo
	bmtTestFunc "$?" 51  "207-d"
	
	#208 
	printf  "\n%s\n"  "Test 208"
	bmtPromptFunc wishtocontinue "Do you wish to continue?" b_yellow
	bmtTestFunc "$?" 0  "208-a"
	printf  "\n%s\n"  "Continued "
	
	#209
	printf  "\n%s\n" "Test 209 center text"
	bmtPromptFunc centertext "Hello World." 
	bmtTestFunc 1 1 "209-a" "NOAUTO"
	
	#210
	printf  "\n%s\n" "Test 210 event status"
	bmtPromptFunc eventstatus "Installing bashMultiTool" "OK" b_green
	bmtPromptFunc eventstatus "File upload" "Fail" b_red
	bmtPromptFunc eventstatus "File upload" "Pending" 
	bmtTestFunc 1 1 "210-a" "NOAUTO"
	
}

function testnetworkFunc
{
	printf "|\n%s\n"  "=== Start Network Tests === " # Section 3
	# error handling check(catch typos)
	echo "Error handling"
	bmtNetworkFunc
	bmtTestFunc "$?" 255 "30E-a"
	bmtNetworkFunc foo
	bmtTestFunc "$?" 255 "30E-b"
	
	# 301 checknet
	echo " "
	echo "Test 301 "
	bmtNetworkFunc checknet "www.google.ie"  
	bmtTestFunc "$?" 0 "301-a"
	bmtNetworkFunc checknet "www.fgfoofoondoid4gnd.ie" 
	bmtTestFunc "$?" 2 "301-b"
	bmtNetworkFunc checknet "www.google.ie" "NOMES" 
	bmtTestFunc "$?" 0 "301-c"
	bmtNetworkFunc checknet "www.ggleff11199g.ie" "NOMES"
	bmtTestFunc "$?" 2 "301-d"
	
	# 302
	echo " "
	echo "Test 302 "
	bmtNetworkFunc weather Cork 4 
	bmtTestFunc "$?" 0 "302-a"
}

function testlinuxFunc
{
	printf  "\n%s\n"  "=== Start Linux Tests === " # Section 4
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
	printf "\n%s\n" " Check distro 402"
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

function testfileFunc
{
printf "\n%s\n"  "=== Start Files  Tests === " # Section 5
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
bmtTestFunc "$?" 4 "509-c"  # file does not exist

# 510
echo
echo "Filename extraction 510 /foo/foo123/tv.png"
bmtFilesFunc filename "/foo/foo123/tv.png" 1 
echo  " :: File name $?"
bmtFilesFunc filename "/foo/foo123/tv.png" 2 
echo  " :: Base name $?"
bmtFilesFunc filename "/foo/foo123/tv.png" 3 
echo  " :: Extension $?"
bmtFilesFunc filename "/foo/foo123/tv.png" 4 
echo  " :: Folder name $?"
bmtTestFunc 1 1 "510-a"  "NOAUTO"

# 510 errors 
bmtFilesFunc filename  # no args passed
bmtTestFunc "$?" 2 "510-b"   
bmtFilesFunc filename "/foo/foo123/tv.png"  # no or wrong condition($2) passed
bmtTestFunc "$?" 3 "510-c" 
bmtFilesFunc filename "/foo/foo123/tv"  3 # no extension passed. 
bmtTestFunc "$?" 4 "510-d" 
}

function testdataFunc
{
	printf "\n%s\n"  "=== Start Data Tests === " # Section 6
	echo "Error handling check"
	bmtDataFunc foofoo
	bmtTestFunc "$?" 255 "60E-a"
	bmtDataFunc 
	bmtTestFunc "$?" 255 "60E-b"
	
	# intcheck 601
	printf  "\n%s\n"  "601-a Enter an integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	bmtTestFunc "$?" 0 "601-a"

	printf  "\n%s\n"  "601-b Enter a NON integer"
	read -r ID
	bmtDataFunc intcheck "$ID"
	bmtTestFunc "$?" 2 "601-b"

	## alphanumeric 602
	printf  "\n%s\n" "602-a Enter an alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	bmtTestFunc "$?" 0 "602-a"
	
	printf  "\n%s\n" "602-b Enter a NON alpha numeric string"
	read -r ID1
	bmtDataFunc alphanumcheck "$ID1"
	bmtTestFunc "$?" 2 "602-b"
	
	## alpha check 603
	printf  "\n%s\n" "603-a Enter an alphabetical string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	bmtTestFunc "$?" 0 "603-a"

	printf  "\n%s\n" "603-b Enter an NON alphabetical string"
	read -r ID2
	bmtDataFunc alphacheck "$ID2"
	bmtTestFunc "$?" 2 "603-b"
	
	# lowercase 
	printf  "\n%s\n" "604 lowercase test"
	result=$(bmtDataFunc lowercase "TEST")   # or result=`myfunc`
	printf  "%s\n" "$result"
	bmtTestFunc 1 1 "604-a"  "NOAUTO"
	
	#uppercase 
	printf  "\n%s\n" "605 uppercase test"
	result1=$(bmtDataFunc uppercase "test")
	printf  "%s\n" "$result1"
	bmtTestFunc 1 1 "605-a"  "NOAUTO"
	
	# trim 
	printf  "\n%s\n" "606 trim test"
	mytrim="       test   "
	result2=$(bmtDataFunc trim "$mytrim")
	printf  "%s\n" "$result2"
	bmtTestFunc 1 1 "606-a"  "NOAUTO"

	# string length 
	printf  "\n%s\n" "607 string length test"
	bmtDataFunc strlen "test string 123" # 15
	bmtTestFunc "$?" 15 "607-a"
	bmtDataFunc strlen "" #report 250 error
	bmtTestFunc "$?" 250 "607-b"
}

function testtimeFunc
{
	printf "\n%s\n"  "=== Start Time Tests === " # Section 7
	# error handling check(catch typos)
	printf  "%s\n"  "Error handling"
	bmtTimeFunc
	bmtTestFunc "$?" 255 "70E-a"
	bmtTimeFunc foo
	bmtTestFunc "$?" 255 "70E-b"
	
	# 701 , prints 1651084921
	printf  "\n%s\n" "701-a Convert time to  epoch time ::"
	bmtTimeFunc epochconvert "2022-04-27 19:42:01 "
	printf  "%s\n"  " Pass :: 1651084921"
	bmtTestFunc 1 1 "701-a" "NOAUTO"

	# 702
	printf  "\n%s\n"  "702-b Current time Stamp ::"
	bmtTimeFunc epochnow
	echo
	bmtTestFunc 1 1 "702-b" "NOAUTO"
	
	# 703 call spinner function put run in background and save PID
	printf  "\n%s\n" "Test 703-a  spinner"
	
	bmtTimeFunc  spin &
	pid=$!
	disown
	
	sleep 10 # Do stuff here 
	
	kill $pid 	# Stop spin function with PID
	sleep 1
	printf "\r%s\n" "     "
	bmtTestFunc 1 1 "703-a" "NOAUTO"

	# 704-707
	printf  "\n%s\n" "Test 704-707 Stopwatch timer"
	bmtTimeFunc startWatch
	sleep .100
	bmtTimeFunc stopWatch
	echo " 0.1 S"
	
	bmtTimeFunc startWatch
	sleep 1
	bmtTimeFunc stopWatch
	echo " 1.0 S"

	bmtTimeFunc startWatch
	sleep 4.8
	bmtTimeFunc stopWatch
	echo " 4.8 S"
	bmtTestFunc 1 1 "704-a" "NOAUTO"
	
	# 708 call progressbar function put run in background and save PID

	printf  "\n%s\n" "Test 708 progress bar "
	bmtTimeFunc  progressbar 1 &
	pid=$!
	disown
	sleep 25 # Do stuff , 25 seconds one bar 
	kill $pid 	# Stop spin function with PID
	sleep 1
	echo
	bmtTestFunc 1 1 "708-a" "NOAUTO"
	
	#709 
	printf  "\n%s\n" "Test 709 "
	bmtTimeFunc dateformat "1651084921" 
	printf  "\n%s\n" " Pass :: 2022-04-27 19:42:01"

	bmtTimeFunc dateformat "1651084921" "%FT%T%z"
	printf  "\n%s\n" " Pass :: 2022-04-27T19:42:01+0100"
	
	bmtTestFunc 1 1 "709-a" "NOAUTO"

	#701 702 & 709 combined
	local timeVar2
	local timeVar
	printf  "\n%s\n" " Test 70X-a 701 702 and  709 combined"
	timeVar="$(bmtTimeFunc epochnow)"  # get current time in epoch seconds
	printf  "%s\n" "Epoch time in :: $timeVar"
	timeVar2="$(bmtTimeFunc dateformat "$timeVar")" # Convert that to a date time
	printf  "%s\n%s" "Time converted :: $timeVar2" "Epoch Time Out :: "
	bmtTimeFunc epochconvert "$timeVar2" #  Convert back to epoch
	echo
	bmtTestFunc 1 1 "70X-a" "NOAUTO"
	
	# 710 call spinner function put run in background and save PID
	printf  "\n%s\n" "Test 710  spinner"
	
	bmtTimeFunc  spintwo &
	pid=$!
	disown
	
	sleep 10 # Do stuff here 
	
	kill $pid 	# Stop spin function with PID
	sleep 1
	printf "\r%s\n" " "
	bmtTestFunc 1 1 "710-a" "NOAUTO"
	
}

function testmiscFunc
{
	printf "\n%s\n"  "=== Start Misc Tests === " # Section 8
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
	bmtTestFunc "$?" 127 "802-b"
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
	
	#805 
	echo "805 Test center text"
	bmtMiscFunc centertext "Hello World" -
	bmtTestFunc 1 1 "805-a" "NOAUTO"
	echo 
	
	bmtPrintFunc b_red
	bmtMiscFunc centertext "HelloWorld In Red" =
	bmtTestFunc 1 1 "805-b" "NOAUTO"
	echo
	
	#806
	echo "806 test Display Gauge"
	bmtMiscFunc gauge  "Value" 25 1 50 "#" "."
	bmtTestFunc 1 1 "806-a" "NOAUTO"
	echo
	
	bmtPrintFunc b_red
	bmtMiscFunc gauge  "Value" 2 1 10 "=" " "
	bmtTestFunc 1 1 "806-b" "NOAUTO"
	echo
}

# === MAIN CODE ===
#Source the lib 
#(LOCAL path not installed for development)
#LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
#installed path
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done

TESTOBJECTS="$HOME/Documents/Tech/Scripts/BashMultiTool/test/testObjects"  # for testfileFunc
declare numberinput="$1"
clear

# Valid input
if [ -z "$numberinput" ] # there an input?
then
	printf "%s\n" "Enter Argument 1-8 or 9 for all tests"
	exit 1
else
	# Valid number?
	[[ "$numberinput" =~ ^[0-9]+$ ]] || { printf "%s\n" "Enter a valid number 1-9 "; exit 1; }
	# Valid range?
	 if  ((numberinput == 0  || numberinput >= 10)); then
		printf "%s\n"  "Enter a number in range 1-9 "
		exit 1
	 fi
fi


bmtTestFunc 1 1 "START"
read -n 1 -r -s -p "Press any key to continue"

case "$numberinput" in
	1|9) testprintFunc ;;&
	2|9) testpromptFunc ;;&
	3|9) testnetworkFunc ;;&
	4|9) testlinuxFunc ;;&
	5|9) testfileFunc ;;&
	6|9) testdataFunc ;;&
	7|9) testtimeFunc ;;&
	8|9) testmiscFunc ;;
esac

printf "\n" 
bmtTestFunc 1 1 "END"
# === EOF ===
