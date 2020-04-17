
Overview
--------------------------------------------
* Name: bashmultitool
* Title : Bash Shell library  for commonly used functions.
* Description: A Bash Shell library file for commonly used functions
can be imported into shell scripts to create functional and colorful 
scripts and Terminal users interfaces(TUI).
* Author: Gavin Lyons
* Contact: Upstream repo at github site below or glyons66@hotmail.com
* Upstream repository: [bashmultitool](https://github.com/gavinlyonsrepo/bashmultitool)
* History: See changelog.md in documentation section for version control history 
* Copyright: Copyright (C) 2018 Gavin Lyons MIT expat See LICENSE.md in documentation section 


Table of contents
---------------------------

  * [Overview](#overview)
  * [Table of contents](#table-of-contents)
  * [Installation](#installation)
  * [Usage](#usage)
  * [Files](#files)
  * [Features](#features)
  * [Dependencies](#dependencies)


Installation
-----------------------------------------------

**Linux debian based systems built on Ubuntu 18.04 LTS (Bionic Beaver)**
 
A Personal Package Archives (PPA) has been created on Ubuntu
package building and hosting section of launchpad site 
called bashmultitool.

To install this on your system run commands in terminal

```sh
sudo add-apt-repository ppa:typematrix/bashmultitool
sudo apt update
sudo apt install bashmultitool
```

**For other linux systems**

Download latest fixed release and run the makefile as per 
terminal commands below for version 1.5 latest release at time of writing
Note: If you install with this method you will not be informed of updates 
by system.

```sh
curl -sL https://github.com/gavinlyonsrepo/bashmultitool/archive/1.5.tar.gz | tar xz
cd  bashmultitool-1.5
sudo make install
```
**Arch based System** 

It's also available in the Arch Linux user repo AUR

Usage
-------------------------------------------
Source the library from your bash shell scripts like so:

```sh
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done


```

There are six files in library and they are independent of each other
you can source them individually if you wish, however the prompt file *is* 
dependent on print.

Each file has one function, To access functions from your shell scripts type:



```sh
[functionname] [keyword] [options]
```

Six separate markdown help files with detailed information, 
in documentation folder are available.
For shortcut to each file click on link in 2nd table in *Files and setup* section below.
The repo also contains a test folder where test files used in development are available.

A script to print library meta data for test and debug is also installed.

Files and setup
-----------------------------------------

| File Path | Description |
| ------ | ------ |
| /usr/bin/bashmultitool.sh | Script to print library meta data |
| /usr/lib/bashmultitool/bashmultitool/*  | 6 library files see next table|
| /usr/lib/bashmultitool/doc/README.md    | help      |
| /usr/lib/bashmultitool/doc/documentation/license.md | copyright |
| /usr/lib/bashmultitool/doc/documentation/changelog.md | history |  


| Library file | Function | Sections | Content | Doc link |
| ---- | ---- | ---- | ---- | ---- |
|  bmtPrint | bmtPrintFunc | 101 | Printing text | [bmtPrint help file](documentation/bmtPrint.md)|
|  bmtPrompt | bmtPromptFunc | 201-207 | Prompts | [ bmtPrompt help file](documentation/bmtPrompt.md)|
|  bmtMisc  | bmtMiscFunc  | 301-304  | Miscellaneous | [bmtMisc help file](documentation/bmtMisc.md)|
|  bmtLinux | bmtLinuxFunc | 401-404 | Linux related | [bmtLinux help file](documentation/bmtLinux.md)|
|  bmtFiles | bmtFilesFunc | 501-505 | File related | [bmtFiles help file](documentation/bmtFiles.md)|
|  bmtData | btmDataFunc | 601-606 | Data related | [bmtData help file](documentation/bmtData.md)|


Features
----------------------
The library contains six files and six functions,
which contains 27 sections in total.
The sections are grouped in six files as per logical function.
Printing, prompting, Linux related, file related, 
data related and miscellaneous.


## Section numbered list

* 101 Coloured printed text, 8 colours, 7 modes. 56 options in total.

Colours: Black, Red, Green, Yellow, Blue, Purple, Cyan, White.

Modes: normal, bold, underline, background, hiy, bold hiy, background hiy. 

Note: hiy = high intensity.

Example Output:

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/screenshot/colour_print_example.png)
 
 
* 201 Horizontal lines across terminal in any colour
* 202 yes-no-quit [y/n/q] prompt
* 203 YES-no [Y/n] prompt
* 204 yes-NO [y/N] prompt
* 205 Anykey to continue prompt in any colour
* 206 QUIT-no [Q/n] prompt
* 207 quit-NO [q/N] prompt

* 301 Check if a website is up
* 302 Spinner Animation for long non-verbose commands
* 303 Stopwatch / timer
* 304 Weather forecast

* 401 Check package installed
* 402 Linux distro family checker
* 403 Set text editor $EDITOR if not set
* 404 log file handler

* 501 Make and enter a formated directory
* 502 check if directory exists and empty
* 503 directory exists
* 504 file exists
* 505 device exists

* 601 integer user input check
* 602 alphabet user input check
* 603 alphanumeric user input check
* 604 convert string to lowercase
* 605 convert string to uppercase
* 606 trim whitespace from string


Dependencies
-------------------------------------
1. GNU bash, version 4.4.18-2  

2. The check website section requires netcat installed. [Netcat](https://en.wikipedia.org/wiki/Netcat)
