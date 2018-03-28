# Features of bashmultitool

The library contains six files and six functions which contains 26 sections

## Section description

1) Coloured printed text, eight colours, seven modes.

Colours: Black, Red, Green, Yellow, Blue, Purple, Cyan, White.
Modes: normal, bold, underline, background, hiy, bold hiy, background hiy 
Where hiy = high intensity  

2) Horizontal lines across terminal, in any colour
3) yes-no-quit [y/n/q] prompt
4) YES-no [Y/n] prompt
5) yes-NO [y/N] prompt
6) Anykey to continue prompt, in any colour
7) QUIT-no [Q/n] prompt
8) quit-NO [q/N] prompt
9) Check if a website is up
10) Spinner Animation for long non-verbose commands
11) Stopwatch / timer
12) Check package installed
13) Linux distro family checker
14) Set text editor $EDITOR if not set
15) log file handler
16) Make and enter a formated directory
17) check if directory exists and empty
18) directory exists
19) file exists
20) device exists
21) integer user input check
22) alphabet user input check
23) alphanumeric user input check
24) convert string to lowercase
25) convert string to uppercase
26) trim whitespace from string

## File table

| file name | function name | sections |
| ---- | ---- | ---- |
|  bmtPrint | bmtPrintFunc | 1 |
|  bmtPrompt | bmtPromptFunc | 2-8|
|  bmtMisc  | bmtMiscFunc  | 9-11  |
|  bmtLinux | bmtLinuxFunc | 12-15 |
|  bmtFiles | bmtFilesFunc | 16-20 |
|  bmtData | btmDataFunc | 21-26 |


## Usage 

```sh
[functioname] [keyword] [options]
```

1) Colored printed text  

The keyword represent the color, the text to be printed is first option.
leave text option blank to just change the colour mode of cursor

```sh
bmtPrintFunc red    # change colour, no output.
bmtPrintFunc normal "default terminal text"

bmtPrintFunc black "black"
bmtPrintFunc red "red"
bmtPrintFunc green "green"
bmtPrintFunc yellow "yellow" 
bmtPrintFunc blue "blue "
bmtPrintFunc purple "purple"
bmtPrintFunc cyan "cyan"
bmtPrintFunc white "white" 
bmtPrintFunc b_black "bold black "
bmtPrintFunc b_red "bold red  "
bmtPrintFunc b_green "bold green  "
bmtPrintFunc b_yellow "bold yellow  "
bmtPrintFunc b_blue "bold blue  "
bmtPrintFunc b_purple "bold purple  "
bmtPrintFunc b_cyan "bold cyan  "
bmtPrintFunc b_white "bold white  "
bmtPrintFunc u_black "underline black "
bmtPrintFunc u_red "underline red  "
bmtPrintFunc u_green "underline green  "
bmtPrintFunc u_yellow "underline yellow  "
bmtPrintFunc u_blue "underline blue  "
bmtPrintFunc u_purple "underline purple  "
bmtPrintFunc u_cyan "underline cyan  "
bmtPrintFunc u_white "underline white  "
bmtPrintFunc bg_black "background black "
bmtPrintFunc bg_red "background red  "
bmtPrintFunc bg_green "background green  "
bmtPrintFunc bg_yellow "background yellow  "
bmtPrintFunc bg_blue "background blue  "
bmtPrintFunc bg_purple "background purple  "
bmtPrintFunc bg_cyan "background cyan  "
bmtPrintFunc bg_white "background white  " 
bmtPrintFunc i_black "high intensity black " 
bmtPrintFunc i_red "high intensity red  "
bmtPrintFunc i_green "high intensity green  "
bmtPrintFunc i_yellow "high intensity yellow  "
bmtPrintFunc i_blue "high intensity blue  "
bmtPrintFunc i_purple "high intensity purple  "
bmtPrintFunc i_cyan "high intensity cyan  "
bmtPrintFunc i_white "high intensity white  "
bmtPrintFunc bh_black "high intensity bold black " 
bmtPrintFunc bh_red "high intensity bold red  "
bmtPrintFunc bh_green "high intensity bold green  "
bmtPrintFunc bh_yellow "high intensity bold yellow  "
bmtPrintFunc bh_blue "high intensity bold blue  "
bmtPrintFunc bh_purple "high intensity bold purple  "
bmtPrintFunc bh_cyan "high intensity bold cyan  "
bmtPrintFunc bh_white "high intensity bold white  "
bmtPrintFunc hbg_black "high intensity background black " 
bmtPrintFunc hbg_red "high intensity background red  "
bmtPrintFunc hbg_green "high intensity background green  "
bmtPrintFunc hbg_yellow "high intensity background yellow  "
bmtPrintFunc hbg_blue "high intensity background blue  "
bmtPrintFunc hbg_purple "high intensity background purple  "
bmtPrintFunc hbg_cyan "high intensity background cyan  "
bmtPrintFunc hbg_white "high intensity background white  " 
```

2) Horizontal lines across terminal of single character

Keyword is line, first option the character, second option is colour,
if no colour passed default is "bold cyan"

```sh
	#line
	bmtPromptFunc line    "=" 
	bmtPromptFunc line    "8" red
```

3) yes-no-quit prompt y/n/q

Keyword is yesnoquit , returns codes based on user input

```sh
echo  "Do you want to foo? [y/n/q] :"
bmtPromptFunc yesno
```
Returns 0 for yes , 2 for no , 3 for quit

4) Yes-no prompt [Y/n] where yes is default

Keyword is yesno , returns codes based on user input
second option yes for yes default

```sh
echo "Do you want to foo? [Y/n] :"
bmtPromptFunc yesno yes
```
Returns 2 for yes , 0 for no , 50 for bad user option

5) Yes-no prompt [y/N] where no is default

Keyword is yesno , returns codes based on user input
second option is no for no default

```sh
echo "Do you want to foo? [y/N] :"
bmtPromptFunc yesno no
```
Returns 2 for no , 0 for yes , 50 for bad user option

6) QUIT-no prompt [Q/n] where quit is default

Keyword is quitno , returns codes based on user input
second option quit for quit default

```sh
echo "Do you want to foo? [Y/n] :"
bmtPromptFunc quitno quit
```
Returns 2 for quit , 0 for no , 50 for bad user option

7) Yes-no prompt [y/N] where no is default

Keyword is quitno , returns codes based on user input
second option no for no default
```sh
echo "Do you want to foo? [q/N] :"
bmtPromptFunc quitno no
```
Returns 2 for no , 0 for quit , 50 for bad user option

8) Anykey prompt

Keyword is anykey , first option amended text, second option is colour,
if no colour passed default is "bold cyan"

```sh
bmtPromptFunc anykey "my Text here"
bmtPromptFunc anykey "my Text here" u_red
```

9) Check website up

Keyword checknet, first option url of website. Returns 0 for connectivity , 2 for no connectivity 

```sh
bmtMiscFunc checknet "www.google.ie"
```

10) Animation for non-verbose process/commands that take long time

```sh
	# call spinner section put run in background and save PID
	echo " "
	bmtMiscFunc  spin &
	pid=$!
	disown
	
	# 'do stuff'
	echo "START"
	find ~ -name mint 2>/dev/null 
	echo " "
	echo "END"
	
	# Stop spin function with PID
	kill $pid 
	sleep 2
	echo " "
```

11) Stop watch

Stop watch timer that returns value in seconds between the stop and start
with a scale of 6. Mircoseconds  1.000000.
startwatch creates a global variable called __BMT_START_WATCH
and uses bc - An arbitrary precision calculator language.

```sh
bmtMiscFunc startWatch
sleep 2.8
bmtMiscFunc stopWatch
# returns  ~ 2.813207
```

12) Check package installed

Keyword is checkpac . First option is package name,
Second option is type of distro(options are 1 for pacman based, 2
for debian based, 3 for rpm based)
Third  option is wheter to display message or not include "MES" 
for verbose output

```sh
bmtLinuxFunc  checkpac "firefox"  2  "MES"
```

Returns 0 for installed , 2 for not installed , 
52 for unsupported linux distro

13) Linux distro family checker

```sh
bmtLinuxFunc distrocheck
```

Returns 2-7 for unknown distro family groups or 52 for unknown.
(2 redhat based, 3 fedora based, 4 debian based, 5 pacman based,
6 gentoo based , 7 slackware based.)

14) Is text editor variable $EDITOR set?

```sh
bmtLinuxFunc isTextEdSet
```

returns 0 if it was set, 2 if not and sets it to vi

15) log file handler
Creates a log file entry with standard formated date/time stamp.
First option is state, valid values are 
(EMERGENCY|ALERT|CRITICAL|ERROR|WARNING|NOTICE|INFO|DEBUG|OK|FAILED|PASSED)
second option is message, third option is file name .log is appended i.e mylog becomes mylog.log
Fourth option is path to file.

```sh
	bmtLinuxFunx log "CRITICAL" "1201 alarm Executive overflow - no vacant areas" mylog /tmp/
	bmtLinuxFunx log "CRITICAL" "1202 alarm Executive overflow - no core sets" mylog /tmp/
```

16) Make formated directory

The keyword is makedir, First option is path , second is the text 
appended to end.

```sh
bmtFilesFunc makedir "/tmp/" "-TEST"
```

Output folders are created with following time/date stamp syntax 
HHMM-DDMONYY-X where X is text from third option. 
Makes the directory and cds into it
Returns 0 for success, 52 if in cannot access or create the directory
  
17) Does directory exist and is it empty

The keyword is isdirempty , the first option is path returns 0 for empty
 , 2 for not empty , 3 if it does not exist.

```sh
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/file/"
```

18) directory exists

returns 0 for success, 2 for failure

```sh
bmtFilesFunc directoryexists /tmp/foo
```

19) file exists

returns 0 for success, 2 for failure

```sh
bmtFilesFunc fileexists /tmp/foo
```

20) device exists

returns 0 for success, 2 for failure

```sh
bmtFilesFunc deviceexists /dev/sda
```

21) integer input check

Keyword intcheck, first option the item to be checked if integer

```sh
bmtDataFunc intcheck "$age"
```

Returns 0 for integer , 2 for non integer.

22) Alphanumeric input check

Keyword alphanumcheck, first option the item to be checked if Alphanumeric

```sh
bmtDataFunc alphanumcheck "$address"
```

Returns 0 for alphanumcheck , 2 for non alphanumcheck.

23) alphabet input check

Keyword alphacheck) , first option the item to be checked if alphabet

```sh
bmtDataFunc alphacheck "$name"
```

Returns 0 for alphabet , 2 for non alphabet.

24)  convert a string to lowercase

```sh
	result=$(bmtDataFunc lowercase "TEST")   
	echo $result
```

25)   convert a string to uppercase

```sh
	result=$(bmtDataFunc upperrcase "test")   
	echo $result
```

26)   trim whitespace from a strin

```sh
	result2=$(bmtDataFunc trim "       test   "
	echo $result2
	echo " "
```
