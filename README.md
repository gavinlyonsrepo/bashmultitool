
Overview
--------------------------------------------
* Name: bashmultitool
* Title : Bash Shell library  for commonly used functions.
* Description: A Bash Shell library file for commonly used functions
can be imported into shell scripts to create functional and colorful 
scripts and Terminal users interfaces(TUI).
* Author: Gavin Lyons

Table of contents
---------------------------

  * [Overview](#overview)
  * [Table of contents](#table-of-contents)
  * [Installation](#installation)
  * [Usage](#usage)
  * [Files](#files)
  * [Dependencies](#dependencies)
  * [Features](#features)
  * [Communication](#communication)
  * [History](#history)
  * [Copyright](#copyright)

Installation
-----------------------------------------------

**Linux debian based systems built on Ubuntu 16.04 LTS (Xenial Xerus)**
 
A Personal Package Archives (PPA) has been created on Ubuntu
package building and hosting section of launchpad site 
called bashmultitool.

To install this on your system run commands in terminal

```sh
sudo add-apt-repository ppa:typematrix/bashmultitool
sudo apt update
sudo apt install bashmultitool
```

**Linux Arch pacman based systems AUR**

* AUR package name : bashmultitool
* AUR maintainer : glyons
* AUR location: https://aur.archlinux.org/packages/bashmultitool/

**For other linux systems**

Download latest fixed release and run the makefile as per 
terminal commands below for version 1.2 latest release at time of writing
Note: is you install with this methodyou will not be informed of updates 
by system.

```sh
curl -sL https://github.com/gavinlyonsrepo/bashmultitool/archive/1.2.tar.gz | tar xz
cd  bashmultitool-1.2
sudo make install
```


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

There are six files in library and are independent of each other
you can source them individually if you wish, however prompt file IS 
dependent on print.
Each file has one function, To access functions from your shell scripts:

[functionname] [keyword] [options]


Files and setup
-----------------------------------------

| File Path | Description |
| ------ | ------ |
| /usr/lib/bashmultitool/bashmultitool/*  | 6 library files |
| /usr/lib/bashmultitool/doc/README.md    | readme          |
| /usr/lib/bashmultitool/doc/documentation/license.md | copyright |
| /usr/lib/bashmultitool/doc/documentation/features.md | detailed information |
| /usr/lib/bashmultitool/doc/documentation/changelog.md | history |  

Dependencies
-------------------------------------
GNU bash, version 4.3.48(1)-release 

The check website section requires netcat installed. 

[Netcat](https://en.wikipedia.org/wiki/Netcat)


Features
----------------------
The library contains six files and six functions
which contains 26 sections in total.

1) Coloured printed text, eight colours, seven modes.

Colours: Black, Red, Green, Yellow, Blue, Purple, Cyan, White.

Modes: normal, bold, underline, background, hiy, bold hiy, background hiy 
Where hiy = high intensity  

for example:


![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/screenshot/colour_print_example.png)
 
 
2) Horizontal lines across terminal in any colour
3) yes-no-quit [y/n/q] prompt
4) YES-no [Y/n] prompt
5) yes-NO [y/N] prompt
6) Anykey to continue prompt in any colour
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

For full details see 
Features.md in documentation section 
[Features file](documentation/Features.md)


Communication
-----------
If you should find a bug or you have any other query, 
please send a report.
Pull requests, suggestions for improvements
and new features welcome.
* Contact: Upstream repo at github site below or glyons66@hotmail.com
* Upstream repository: [bashmultitool](https://github.com/gavinlyonsrepo/bashmultitool)

History
------------------
* See changelog.md in documentation section for version control history
 
Copyright
---------
Copyright (C) 2018 Gavin Lyons MIT expat
See LICENSE.md in documentation section 
for more details
