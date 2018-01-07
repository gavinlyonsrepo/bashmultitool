### Features of bashmultitool

```sh
BashMTFunc [keyword][option1][option2][option3]
```

* Colored printed text 16 options 

The keyword represent the color, the text to be printed is first option.

```sh
	BashMTFunc norm "normal text"
	BashMTFunc highlight "highlighted text"
	BashMTFunc black "black Text"
	BashMTFunc red "red Text"
	BashMTFunc green "green Text"
	BashMTFunc tan "tan Text"
	BashMTFunc blue "blue Text"
	BashMTFunc purple "purple Text"
	BashMTFunc cyan "cyan Text"
	BashMTFunc white "white Text"
	BashMTFunc grey "grey Text"
	BashMTFunc b_red "bright red Text"
	BashMTFunc b_green "bright green Text"
	BashMTFunc yellow "yellow Text"
	BashMTFunc b_blue "bright blue Text"
	BashMTFunc b_purple "bright purple Text"
	BashMTFunc b_cyan "bright cyan Text"
	BashMTFunc b_grey "bright grey Text"
```

* Horizontal lines across terminal of single character

Keyword is line, first option the character.

```sh
	#line
	BashMTFunc line    "=" 
	BashMTFunc line    "-" 
```

* Yes-no-Quit prompt

Keyword is yesno , returns codes based on user input

```sh
BashMTFunc norm  "Do you want to foo? [y/n/q] :"
BashMTFunc yesno
```
Returns 0 for yes , 1 for no , 255 for quit

* Anykey prompt

Keyword is anykey , first option amended text.

```sh
BashMTFunc anykey "my Text foo here"
```

* Check website up

Keyword checknet, first option url of website.

```sh
BashMTFunc checknet "www.google.ie"
```

Returns 0 for connectivity , 1 for no connectivity 

* Check package installed

Keyword is checkpac . First option is package name,
Second option is type of distro(options are 1 for pacman based, 2
for debian based, 3 for rpm based)
Third  option is wheter to display message or not include "MES" 
for verbose output

```sh
BashMTFunc  checkpac "firefox"  2  "MES"
```

Returns 0 for installed , 1 for not installed , 255 for unsupported 
linux distro


* Make formated directory

The keyword is makedir, First option is path , second is the text 
appended to end.

```sh
BashMTFunc makedir "/tmp/" "-TEST"
```

Output folders are created with following time/date stamp syntax 
HHMM-DDMONYY-X where X is text from third option. 

Returns 0 with current working dir set in new dir.
  

* Linux distro family checker

```sh
BashMTFunc distrocheck
```

Returns 1-6 for unknown distro family groups or 255 for unknown.
(1 redhat based, 2 fedora based, 3 debian based, 4 pacman based,
5 gentoo based , 6 slackware based.)


* Animation for  non-verbose process/commands that take long time

```sh
	# call spinner function put run in background and save PID
	echo " "
	BashMTFunc spin &
	pid=$!
	
	# Do your code here
	
	# 
	
	# Stop spin function with PID
	kill $pid 
	echo " "
```
