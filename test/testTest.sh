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
	
	# yesnoquit 202  [y/n/q]
	printf "\n%s\n" "Test 202 :: yesnoquit [y/n/q]"
	bmtPromptFunc yesnoquit b_yellow <<< "y"
	bmtTestFunc "$?" 0 "202-y"
	bmtPromptFunc yesnoquit b_yellow <<< "n"
	bmtTestFunc "$?" 2 "202-n"
	bmtPromptFunc yesnoquit b_yellow <<< "q"
	bmtTestFunc "$?" 3 "202-q"

	# yesno yes 203  [y/N] ,  return 0 for yes
	# 'a' here represents "any other key"
	printf "\n%s\n" "Test 203 :: yesno yes [y/N]"
	bmtPromptFunc yesno yes b_yellow <<< "y"
	bmtTestFunc "$?" 0 "203-y"
	bmtPromptFunc yesno yes b_yellow <<< "n"
	bmtTestFunc "$?" 2 "203-n"
	bmtPromptFunc yesno yes b_yellow <<< "a"
	bmtTestFunc "$?" 2 "203-a"

	# yesno no 204  [Y/n] ,  return 0 for no
	# 'a' here represents "any other key"
	printf "\n%s\n" "Test 204 :: yesno no [Y/n]"
	bmtPromptFunc yesno no b_yellow <<< "n"
	bmtTestFunc "$?" 0 "204-n"
	bmtPromptFunc yesno no b_yellow <<< "y"
	bmtTestFunc "$?" 2 "204-y"
	bmtPromptFunc yesno no b_yellow <<< "a"
	bmtTestFunc "$?" 2 "204-a"
	
	# user type catch 203 & 204
	printf  "\n%s\n" "catch user type keyword for test 203 & 204"
	bmtPromptFunc yesno foofoo
	bmtTestFunc "$?" 51  "204-d"
	
	# anykey prompt 205
	printf  "\n%s\n" "Test 205-a  anykey test "
	bmtPromptFunc anykey "" u_green
	echo "my text here 1"
	bmtPromptFunc anykey " and go on to next step"
	echo "my text here 2"
	bmtTestFunc 1 1 "205-a" "NOAUTO"
	
	# quitno quit 206  [q/N] ,  return 0 for quit
	# 'a' here represents "any other key"
	printf "\n%s\n" "Test 206 :: quitno quit [q/N]"
	bmtPromptFunc quitno quit b_yellow <<< "q"
	bmtTestFunc "$?" 0 "206-q"
	bmtPromptFunc quitno quit b_yellow <<< "n"
	bmtTestFunc "$?" 2 "206-n"
	bmtPromptFunc quitno quit b_yellow <<< "a"
	bmtTestFunc "$?" 2 "206-a"
	
	# quitno no 207  [Q/n] ,  return 0 for no
	# 'a' here represents "any other key"
	printf "\n%s\n" "Test 207 :: quitno no [Q/n]"
	bmtPromptFunc quitno no b_yellow <<< "n"
	bmtTestFunc "$?" 0 "207-n"
	bmtPromptFunc quitno no b_yellow <<< "q"
	bmtTestFunc "$?" 2 "207-q"
	bmtPromptFunc quitno no b_yellow <<< "a"
	bmtTestFunc "$?" 2 "207-a"
	
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

	# error handling check (catch typos)
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

	# 302 weather
	echo " "
	echo "Test 302 "
	bmtNetworkFunc weather Cork 4
	bmtTestFunc "$?" 0 "302-a"

	# 303 publicip
	echo " "
	echo "Test 303 "
	bmtNetworkFunc publicip
	bmtTestFunc "$?" 0 "303-a"
	# capture mode: result should be a non-empty string
	local myip303
	myip303=$(bmtNetworkFunc publicip "NOMES")
	bmtTestFunc "$?" 0 "303-b"
	[ -n "$myip303" ]
	bmtTestFunc "$?" 0 "303-c"

	# 304 localip
	echo " "
	echo "Test 304 "
	# auto-detect interface
	bmtNetworkFunc localip
	bmtTestFunc "$?" 0 "304-a"
	# loopback always present - use explicit interface, suppress output
	bmtNetworkFunc localip "lo" "NOMES"
	bmtTestFunc "$?" 0 "304-b"
	# non-existent interface should return 2
	bmtNetworkFunc localip "bmtfakeif99" "NOMES"
	bmtTestFunc "$?" 2 "304-c"

	# 305 dnslookup
	echo " "
	echo "Test 305 "
	bmtNetworkFunc dnslookup "www.google.ie"
	bmtTestFunc "$?" 0 "305-a"
	bmtNetworkFunc dnslookup "www.fgfoofoondoid4gnd.ie" "NOMES"
	bmtTestFunc "$?" 2 "305-b"
	# capture mode
	local myresult305
	myresult305=$(bmtNetworkFunc dnslookup "www.google.ie" "NOMES")
	bmtTestFunc "$?" 0 "305-c"
	[ -n "$myresult305" ]
	bmtTestFunc "$?" 0 "305-d"
	# missing param
	bmtNetworkFunc dnslookup
	bmtTestFunc "$?" 2 "305-e"

	# 306 portcheck
	echo " "
	echo "Test 306 "
	# port 80 on google should be open
	bmtNetworkFunc portcheck "www.google.ie" 80
	bmtTestFunc "$?" 0 "306-a"
	# port 9 (discard) on a bogus host should fail
	bmtNetworkFunc portcheck "www.fgfoofoondoid4gnd.ie" 9 "NOMES"
	bmtTestFunc "$?" 2 "306-b"
	# NOMES on success
	bmtNetworkFunc portcheck "www.google.ie" 80 "NOMES"
	bmtTestFunc "$?" 0 "306-c"
	# missing params
	bmtNetworkFunc portcheck
	bmtTestFunc "$?" 2 "306-d"
	bmtNetworkFunc portcheck "www.google.ie"
	bmtTestFunc "$?" 2 "306-e"

	# 307 pingh
	echo " "
	echo "Test 307 "
	bmtNetworkFunc pingh "www.google.ie"
	bmtTestFunc "$?" 0 "307-a"
	bmtNetworkFunc pingh "www.fgfoofoondoid4gnd.ie" 2 "NOMES"
	bmtTestFunc "$?" 2 "307-b"
	# NOMES on success
	bmtNetworkFunc pingh "www.google.ie" 2 "NOMES"
	bmtTestFunc "$?" 0 "307-c"
	# missing param
	bmtNetworkFunc pingh
	bmtTestFunc "$?" 2 "307-d"

	# 308 download
	echo " "
	echo "Test 308 "
	# download a small known plain-text file to /tmp
	bmtNetworkFunc download "https://icanhazip.com" "/tmp" "NOMES"
	bmtTestFunc "$?" 0 "308-a"
	# clean up
	rm -f /tmp/icanhazip.com
	# bad URL should return 2
	bmtNetworkFunc download "https://www.fgfoofoondoid4gnd.ie/nosuchfile.txt" "/tmp" "NOMES"
	bmtTestFunc "$?" 2 "308-b"
	# missing param
	bmtNetworkFunc download
	bmtTestFunc "$?" 2 "308-c"

	# 309 netif
	echo " "
	echo "Test 309 "
	# always returns 0; just verify it runs
	bmtNetworkFunc netif
	bmtTestFunc "$?" 0 "309-a"
	# NOMES: output should be parseable (at least one line with two fields)
	local mynetif309
	mynetif309=$(bmtNetworkFunc netif "NOMES")
	bmtTestFunc "$?" 0 "309-b"
	[ -n "$mynetif309" ]
	bmtTestFunc "$?" 0 "309-c"

	# 310 sshcheck
	echo " "
	echo "Test 310 "
	# port 80 on google is open; use it to verify the nc logic works
	# (pure SSH server not guaranteed in test environment)
	bmtNetworkFunc sshcheck "www.google.ie" 80
	bmtTestFunc "$?" 0 "310-a"
	# bogus host should fail
	bmtNetworkFunc sshcheck "www.fgfoofoondoid4gnd.ie" "NOMES"
	bmtTestFunc "$?" 2 "310-b"
	# NOMES on success
	bmtNetworkFunc sshcheck "www.google.ie" 80 "NOMES"
	bmtTestFunc "$?" 0 "310-c"
	# missing param
	bmtNetworkFunc sshcheck
	bmtTestFunc "$?" 2 "310-d"

	printf "|\n%s\n"  "=== End Network Tests === "
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
	bmtLinuxFunc checkpac "conky"  2  #installed package
	bmtTestFunc "$?" 0 "401-a"
	bmtLinuxFunc checkpac "foooodds" 2  #non installed package 
	bmtTestFunc "$?" 2 "401-b"
	
	bmtLinuxFunc checkpac "conky"  2  "MES" #installed package
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
	bmtLinuxFunc user "gll"
	bmtTestFunc "$?" 0 "405-a" 
	bmtLinuxFunc user "foo12323"
	bmtTestFunc "$?" 2 "405-b" 
	# check if varible set and empty
	printf "\n%s\n" "Variable check 406"
	# shellcheck disable=SC2034  # used indirectly via ${!var_name} in isvarempty
	local varsetfull="foo"
	# shellcheck disable=SC2034  # used indirectly via ${!var_name} in isvarempty
	local varsetempty=""
	
	bmtLinuxFunc isvarempty varsetfull
	bmtTestFunc "$?" 0 "406-a" 
	bmtLinuxFunc isvarempty varsetempty
	bmtTestFunc "$?" 2 "406-b" 
	bmtLinuxFunc isvarempty foofoo
	bmtTestFunc "$?" 3 "406-c" 
	# root running check
	printf "\n%s\n" "Root running check 407"
	bmtLinuxFunc runasroot
	bmtTestFunc "$?" 2 "407-a" 
	# is command available check
	printf "\n%s\n"  "Is command  check 408"
	bmtLinuxFunc iscommand tput
	bmtTestFunc "$?" 0 "408-a" 
	bmtLinuxFunc iscommand foofoo
	bmtTestFunc "$?" 2 "408-b" 

	# sysinfo
	printf "\n%s\n" "System info 409"
	# plain output: always returns 0, five lines of content
	bmtLinuxFunc sysinfo
	bmtTestFunc "$?" 0 "409-a"
	# MES labelled output: same return, verify lines carry expected prefixes
	local sysout409
	sysout409=$(bmtLinuxFunc sysinfo "MES")
	bmtTestFunc "$?" 0 "409-b"
	echo "$sysout409" | grep -q "^OS:"
	bmtTestFunc "$?" 0 "409-c"
	echo "$sysout409" | grep -q "^Kernel:"
	bmtTestFunc "$?" 0 "409-d"
	echo "$sysout409" | grep -q "^RAM:"
	bmtTestFunc "$?" 0 "409-e"
	# manual review: visually confirm output looks correct
	bmtLinuxFunc sysinfo "MES"
	bmtTestFunc 1 1 "409-f" "NOAUTO"

	# isrunning
	printf "\n%s\n" "Is process running 410"
	# bash is always running (it is our shell)
	bmtLinuxFunc isrunning "bash"
	bmtTestFunc "$?" 0 "410-a"
	# MES flag on a running process
	bmtLinuxFunc isrunning "bash" "MES"
	bmtTestFunc "$?" 0 "410-b"
	# non-existent process name
	bmtLinuxFunc isrunning "foofoo12399"
	bmtTestFunc "$?" 2 "410-c"
	# MES flag on a non-running process
	bmtLinuxFunc isrunning "foofoo12399" "MES"
	bmtTestFunc "$?" 2 "410-d"
	# missing param: should return 1
	bmtLinuxFunc isrunning
	bmtTestFunc "$?" 1 "410-e"
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

# Get file size 507
echo "getfilesize 507"
bmtFilesFunc getfilesize "$TESTOBJECTS/tv.png"
bmtTestFunc "$?" 0 "507-a"  # success
local size507=0
local result507=2
size507=$(bmtFilesFunc getfilesize "$TESTOBJECTS/tv.png")
echo "Size of file is $size507"
if [ "$size507" = "32K" ]
then
	result507=0
fi
bmtTestFunc "$?" "$result507" "507-b"
bmtFilesFunc getfilesize "/foo/foo.txt"
bmtTestFunc "$?" 2 "507-c"  # fail
echo 

# Get file size in bytes 508
echo "getfilesizebytes 508"
bmtFilesFunc getfilesizebytes "$TESTOBJECTS/tv.png"
bmtTestFunc "$?" 0 "508-a"  # success
local size508=0
local result508=2
size508=$(bmtFilesFunc getfilesizebytes "$TESTOBJECTS/tv.png")
echo "Size of file is $size508"
if [ "$size508" = "31011" ]
then
	result508=0
fi
bmtTestFunc "$?" "$result508" "508-b"
bmtFilesFunc getfilesizebytes "/foo/foo.txt"
bmtTestFunc "$?" 2 "508-c"  # fail
echo 

# get mime type 509
echo "Get mime type of provided input 509"
# print to console
local mimetype509=0
local result509=2
mimetype509=$(bmtFilesFunc getmimetype "$TESTOBJECTS/tv.png")
echo "mime type of file is $mimetype509"
if [ "$mimetype509" = "image/png" ]
then
	result509=0
fi
bmtTestFunc "$?" "$result509" "509-a"
echo 
# file does not exist
bmtFilesFunc getmimetype "/foo/foo/tv.png"
bmtTestFunc "$?" 4 "509-b"  

# 510
echo
echo "Filename extraction 510 /foo/foo123/tv.png"
local fn510_1 fn510_2 fn510_3 fn510_4
local rc510
fn510_1=$(bmtFilesFunc filename "/foo/foo123/tv.png" 1)
[ -n "$fn510_1" ]; rc510=$?
echo "Filename is $fn510_1"
bmtTestFunc "$rc510" 0 "510-a1"  # filename: tv.png
fn510_2=$(bmtFilesFunc filename "/foo/foo123/tv.png" 2)
[ -n "$fn510_2" ]; rc510=$?
echo "Basename is $fn510_2"
bmtTestFunc "$rc510" 0 "510-a2"  # basename: tv
fn510_3=$(bmtFilesFunc filename "/foo/foo123/tv.png" 3)
[ -n "$fn510_3" ]; rc510=$?
echo "Extension is $fn510_3"
bmtTestFunc "$rc510" 0 "510-a3"  # extension: png
fn510_4=$(bmtFilesFunc filename "/foo/foo123/tv.png" 4)
[ -n "$fn510_4" ]; rc510=$?
echo "Folder is $fn510_4"
bmtTestFunc "$rc510" 0 "510-a4"  # folder: foo123

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
	bmtDataFunc intcheck "42"
	bmtTestFunc "$?" 0 "601-a"

	printf  "\n%s\n"  "601-b Enter a NON integer"
	bmtDataFunc intcheck "abc"
	bmtTestFunc "$?" 2 "601-b"

	# alphanumeric 602
	printf  "\n%s\n" "602-a Enter an alpha numeric string"
	bmtDataFunc alphanumcheck "ABC123"
	bmtTestFunc "$?" 0 "602-a"
	
	printf  "\n%s\n" "602-b Enter a NON alpha numeric string"
	bmtDataFunc alphanumcheck "££##"
	bmtTestFunc "$?" 2 "602-b"
	
	# alpha check 603
	printf  "\n%s\n" "603-a Enter an alphabetical string"
	bmtDataFunc alphacheck  "Hello"
	bmtTestFunc "$?" 0 "603-a"

	printf  "\n%s\n" "603-b Enter an NON alphabetical string"
	bmtDataFunc alphacheck  "1234"
	bmtTestFunc "$?" 2 "603-b"
	
	# lowercase 604
	printf "\n%s\n" "604 lowercase test"
	result=$(bmtDataFunc lowercase "TEST")
	[ "$result" = "test" ]
	bmtTestFunc "$?" 0 "604-a"

	# uppercase 605
	printf "\n%s\n" "605 uppercase test"
	result1=$(bmtDataFunc uppercase "test")
	[ "$result1" = "TEST" ]
	bmtTestFunc "$?" 0 "605-a"

	# trim 606
	printf "\n%s\n" "606 trim test"
	mytrim="       test   "
	result2=$(bmtDataFunc trim "$mytrim")
	[ "$result2" = "test" ]
	bmtTestFunc "$?" 0 "606-a"

	# string length 607
	printf "\n%s\n" "607 string length test"
	bmtDataFunc strlen "test string 123"
	bmtTestFunc "$?" 15 "607-a"
	bmtDataFunc strlen ""
	bmtTestFunc "$?" 250 "607-b"

	# contains 608 - already automated, no change needed
	printf "\n%s\n" "608 contains test"
	bmtDataFunc contains "hello world" "world"
	bmtTestFunc "$?" 0 "608-a"
	bmtDataFunc contains "hello world" "xyz"
	bmtTestFunc "$?" 2 "608-b"
	bmtDataFunc contains "hello world" "hello"
	bmtTestFunc "$?" 0 "608-c"
	bmtDataFunc contains "hello world" "hello world"
	bmtTestFunc "$?" 0 "608-d"
	bmtDataFunc contains "hello" ""
	bmtTestFunc "$?" 1 "608-e"
	bmtDataFunc contains "" "world"
	bmtTestFunc "$?" 1 "608-f"

	# strreplace 609
	printf "\n%s\n" "609 strreplace test"
	result3=$(bmtDataFunc strreplace "hello world world" "world" "bash")
	[ "$result3" = "hello bash world" ]
	bmtTestFunc "$?" 0 "609-a"
	result4=$(bmtDataFunc strreplace "hello world world" "world" "bash" "ALL")
	[ "$result4" = "hello bash bash" ]
	bmtTestFunc "$?" 0 "609-b"
	result5=$(bmtDataFunc strreplace "hello world" "world" "")
	[ "$result5" = "hello " ]
	bmtTestFunc "$?" 0 "609-c"
	bmtDataFunc strreplace "" "world" "bash"
	bmtTestFunc "$?" 1 "609-d"
	bmtDataFunc strreplace "hello" "" "bash"
	bmtTestFunc "$?" 1 "609-e"

	# strrev 610
	printf "\n%s\n" "610 strrev test"
	result6=$(bmtDataFunc strrev "hello")
	[ "$result6" = "olleh" ]
	bmtTestFunc "$?" 0 "610-a"
	result7=$(bmtDataFunc strrev "racecar")
	[ "$result7" = "racecar" ]
	bmtTestFunc "$?" 0 "610-b"
	bmtDataFunc strrev ""
	bmtTestFunc "$?" 1 "610-c"
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
	bmtMiscFunc password "/tmp" <<< "16"
	bmtTestFunc "$?" 0 "801-a"
	echo "Generated password: at /tmp/ $(cat /tmp/passwordBMT.txt) length should be 16"
	echo  
	
	#802 battery level 
	echo "802 test"
	bmtMiscFunc getbatlevel "BAT0" "MES"
	echo "$?"
	bmtTestFunc 1 1 "802-a" "NOAUTO"
	
	bmtMiscFunc getbatlevel "foo" "MES"
	bmtTestFunc "$?" 127 "802-b"
	echo  
}


function testdrawFunc
{	
	printf "\n%s\n"  "=== Start Draw Tests === " # Section 9
	# error handling check(catch typos)
	echo "Error handling:: "
	bmtDrawFunc # No keyword
	bmtTestFunc "$?" 255 "90E-a"
	bmtDrawFunc foo # Wrong keyword
	bmtTestFunc "$?" 255 "90E-a"
	# 901 
	echo
	echo "901 test box"
	# 1 = red,box 2 = green,text "tput setaf  colours"
	bmtDrawFunc drawbox 1 2 'first line' 'second line' 'third line'
	bmtTestFunc 1 1 "901-a" "NOAUTO"
	echo  
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	bmtDrawFunc drawbox 7 6 'hello world' 
	bmtTestFunc 1 1 "901-b" "NOAUTO"
	echo  
	
	# 902 
	echo "902 test title"
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	bmtDrawFunc title 7 6   '#' 'hello'
	bmtTestFunc 1 1 "902-a" "NOAUTO"
	echo  
	# 2 = green,box  6= cyan,text "tput setaf  colours"
	bmtDrawFunc title 2 6   '+' 'World bye'
	bmtTestFunc 1 1 "902-b" "NOAUTO"
	echo 
	
	# 903
	echo "903 Test center text"
	bmtDrawFunc centertext "Hello World" -
	bmtTestFunc 1 1 "903-a" "NOAUTO"
	echo 
	
	bmtPrintFunc b_red
	bmtDrawFunc centertext "HelloWorld In Red" =
	bmtTestFunc 1 1 "903-b" "NOAUTO"
	echo
	
	# 904
	echo "904 test Display Gauge"
	bmtDrawFunc gauge  "Value" 25 1 50 "#" "."
	bmtTestFunc 1 1 "904-a" "NOAUTO"
	echo
	
	bmtPrintFunc b_red
	bmtDrawFunc gauge  "Value" 2 1 10 "=" " "
	bmtTestFunc 1 1 "904-b" "NOAUTO"
	echo

	# 905 table
	printf "\n%s\n" "Test 905 table"
	bmtDrawFunc table 3 2 "OS" "Linux" "Uptime" "3 days" "CPU" "Intel i7" "RAM" "16 GB"
	bmtTestFunc "$?" 0 "905-a"
	# odd number of pairs (trailing key with no value)
	bmtDrawFunc table 2 3 "Host" "myserver" "Kernel"
	bmtTestFunc "$?" 0 "905-b"
	# single pair
	bmtDrawFunc table 3 2 "Key" "Value"
	bmtTestFunc "$?" 0 "905-c"
	# visual check
	bmtTestFunc 1 1 "905-d" "NOAUTO"

	# 906 menu
	printf "\n%s\n" "Test 906 menu"
	# valid choice: pipe input to simulate user selecting option 2
	bmtDrawFunc menu 3 2 "Choose an option:" "Start" "Stop" "Restart" <<< "2"
	bmtTestFunc "$?" 2 "906-a"
	# valid choice: first item
	bmtDrawFunc menu 3 2 "Choose an option:" "Start" "Stop" "Restart" <<< "1"
	bmtTestFunc "$?" 1 "906-b"
	# valid choice: last item
	bmtDrawFunc menu 3 2 "Choose an option:" "Start" "Stop" "Restart" <<< "3"
	bmtTestFunc "$?" 3 "906-c"
	# out of range: too high
	bmtDrawFunc menu 3 2 "Choose:" "Start" "Stop" <<< "9"
	bmtTestFunc "$?" 254 "906-d"
	# out of range: zero
	bmtDrawFunc menu 3 2 "Choose:" "Start" "Stop" <<< "0"
	bmtTestFunc "$?" 254 "906-e"
	# non-integer input
	bmtDrawFunc menu 3 2 "Choose:" "Start" "Stop" <<< "abc"
	bmtTestFunc "$?" 253 "906-f"
	# empty input
	bmtDrawFunc menu 3 2 "Choose:" "Start" "Stop" <<< ""
	bmtTestFunc "$?" 253 "906-g"

	# 907 cols
	printf "\n%s\n" "Test 907 cols"
	bmtDrawFunc cols 3 4 "alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta"
	bmtTestFunc "$?" 0 "907-a"
	# two columns
	bmtDrawFunc cols 2 3 "one" "two" "three" "four" "five"
	bmtTestFunc "$?" 0 "907-b"
	# single column
	bmtDrawFunc cols 1 2 "only" "these" "items"
	bmtTestFunc "$?" 0 "907-c"
	# invalid column count: zero
	bmtDrawFunc cols 0 4 "a" "b"
	bmtTestFunc "$?" 2 "907-d"
	# invalid column count: non-integer
	bmtDrawFunc cols "abc" 4 "a" "b"
	bmtTestFunc "$?" 2 "907-e"
	# visual check
	bmtTestFunc 1 1 "907-f" "NOAUTO"
	echo
}

# === MAIN CODE ===
#Source the lib 
#(LOCAL path not installed for development)
#LIBPATH="$HOME/Documents/Tech/Scripts/BashMultiTool/lib/"
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
	printf "%s\n" "Enter Argument 1-9 or 0 for all tests"
	exit 1
else
	# Valid number?
	[[ "$numberinput" =~ ^[0-9]+$ ]] || { printf "%s\n" "Enter a valid number 0-9 "; exit 1; }
	# Valid range?
	 if  ((numberinput < 0  || numberinput >= 10)); then
		printf "%s\n"  "Enter a number in range 0-9 "
		exit 1
	 fi
fi


bmtTestFunc 1 1 "START"
read -n 1 -r -s -p "Press any key to continue"

case "$numberinput" in
	1|0) testprintFunc ;;&
	2|0) testpromptFunc ;;&
	3|0) testnetworkFunc ;;&
	4|0) testlinuxFunc ;;&
	5|0) testfileFunc ;;&
	6|0) testdataFunc ;;&
	7|0) testtimeFunc ;;&
	8|0) testmiscFunc ;;&
	9|0) testdrawFunc ;;
esac

printf "\n" 
# exit with return code of bmtTestFunc, which should be 0 if all tests passed
bmtTestFunc 1 1 "END"
exit "$?"
# === EOF ===
