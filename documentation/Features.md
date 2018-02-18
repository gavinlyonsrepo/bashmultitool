### Features of bashmultitool

Features
----------------------
The library contains six files and six functions
which contains 16 sections

## Section description

1) Colored printed text, eight colors, 5 modes.
Colors: Black Red Green Yellow Blue Purple Cyan White.
Modes: normal bold bright underline background.
2) Horizontal lines across terminal
3) yes-no-quit y/n/q prompt
4) YES-no Y/n prompt
5) yes-NO y/N prompt
6) Anykey to continue prompt
7) Check website up
8) Spinner Animation for long non-verbose commands
9) Check package installed
10) Linux distro family checker
11) Set text editor $EDITOR if not set
12) Make formated directory
13) check if directory exists and empty
14) integer input check
15) alphabet input check
16) alpha input numeric check


## File table

| file name | function name | sections | 
| ---- | ---- | ---- |
|  bmtData | btmDataFunc | 14-16 |              
|  bmtFiles | bmtFilesFunc | 12-13 |
|  bmtLinux | bmtLinuxFunc | 9-11 |
|  bmtMisc  | bmtMiscFunc  | 7-8  |
|  bmtPrint | bmtPrintFunc | 1 |
|  bmtPrompt | bmtPromptFunc | 2-6| 


## Usage 

```sh
[functioname] [keyword] [options]
```

All functions return 127 and error message for user keyword typo error

1) Colored printed text  

The keyword represent the color, the text to be printed is first option.

```sh
bmtPrintFunc black "black"
bmtPrintFunc red "red"
bmtPrintFunc green "green"
bmtPrintFunc yellow "yellow" #tan
bmtPrintFunc blue "blue "
bmtPrintFunc purple "purple"
bmtPrintFunc cyan "cyan"
bmtPrintFunc white "white" #light grey

bmtPrintFunc b_black "bold black " #dark grey
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
bmtPrintFunc bg_white "background white  " #very light grey

bmtPrintFunc i_black "high intensity black " #very dark grey
bmtPrintFunc i_red "high intensity red  "
bmtPrintFunc i_green "high intensity green  "
bmtPrintFunc i_yellow "high intensity yellow  "
bmtPrintFunc i_blue "high intensity blue  "
bmtPrintFunc i_purple "high intensity purple  "
bmtPrintFunc i_cyan "high intensity cyan  "
bmtPrintFunc i_white "high intensity white  "
```

2) Horizontal lines across terminal of single character

Keyword is line, first option the character.

```sh
	#line
	bmtPromptFunc line    "=" 
	bmtPromptFunc line    "-" 
```

3) yes-no-quit prompt y/n/q

Keyword is yesnoquit , returns codes based on user input

```sh
echo  "Do you want to foo? [y/n/q] :"
bmtPromptFunc yesno
```
Returns 0 for yes , 2 for no , 3 for quit


4) Yes-no prompt Y/n where yes is default

Keyword is yesnoquit , returns codes based on user input

```sh
echo "Do you want to foo? [Y/n] :"
bmtPromptFunc yesno yes
```
Returns 2 for yes , 0 for no , 128 for bad user option


5) yes-no-quit prompt y/n/q

Keyword is yesnoquit , returns codes based on user input

```sh
echo "Do you want to foo? [y/N] :"
bmtPromptFunc yesno no
```
Returns 2 for no , 0 for yes , 128 for bad user option

6) Anykey prompt

Keyword is anykey , first option amended text.


```sh
bmtPromptFunc anykey "my Text  here"
```


7) Check website up

Keyword checknet, first option url of website.

```sh
bmtMiscFunc checknet "www.google.ie"
```

Returns 0 for connectivity , 2 for no connectivity 

8) Animation for non-verbose process/commands that take long time

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

9) Check package installed

Keyword is checkpac . First option is package name,
Second option is type of distro(options are 1 for pacman based, 2
for debian based, 3 for rpm based)
Third  option is wheter to display message or not include "MES" 
for verbose output

```sh
bmtLinuxFunc  checkpac "firefox"  2  "MES"
```

Returns 0 for installed , 2 for not installed , 
255 for unsupported linux distro

10) Linux distro family checker

```sh
bmtLinuxFunc distrocheck
```

Returns 2-7 for unknown distro family groups or 255 for unknown.
(2 redhat based, 3 fedora based, 4 debian based, 5 pacman based,
6 gentoo based , 7 slackware based.)

11) Is text editor variable $EDITOR set?

```sh
bmtLinuxFunc isTextEdSet
```

returns 0 if it was set, 2 if not and sets it to vi


12) Make formated directory

The keyword is makedir, First option is path , second is the text 
appended to end.

```sh
bmtFilesFunc makedir "/tmp/" "-TEST"
```

Output folders are created with following time/date stamp syntax 
HHMM-DDMONYY-X where X is text from third option. 
Makes the directory and cds into it

Returns 0 for success, 255 if in cannot access or create the directory
  
13) Does directory exist and is it empty

The keyword is isdirempty , the first option is path

```sh
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/file/"
```

returns 0 for empty , 2 for not empty , 3 if it does not exist.


14) integer input check

Keyword intcheck, first option the item to be checked if integer

```sh
bmtDataFunc intcheck "$age"
```

Returns 0 for integer , 2 for non integer.

15) Alphanumeric input check

Keyword alphanumcheck, first option the item to be checked if Alphanumeric

```sh
bmtDataFunc alphanumcheck "$address"
```

Returns 0 for alphanumcheck , 2 for non alphanumcheck.

16) alphabet input check

Keyword alphacheck) , first option the item to be checked if alphabet

```sh
bmtDataFunc alphacheck "$name"
```

Returns 0 for alphabet , 2 for non alphabet.
