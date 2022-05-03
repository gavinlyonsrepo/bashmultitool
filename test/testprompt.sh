#!/bin/bash
#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#name: testprompt.sh
#Description: test file for bashmultitool, file bmtPrompt
#Written : Gavin Lyons

# === FUNCTIONS ===
#Source the lib, note local path.
LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done


function Test_Func
{
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

Test_Func
# === END ===
