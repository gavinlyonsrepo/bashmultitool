
Overview
--------------------------------------------
* Name: bashmultitool
* Title : Bash Shell library file for commonly used functions.
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
  * [Return codes](#return-codes)
  * [Communication](#communication)
  * [History](#history)
  * [Copyright](#copyright)

Installation
-----------------------------------------------
A Personal Package Archives (PPA) has been created on Ubuntu
package building and hosting section of launchpad site 
called bashmultitool.

Package built only for on Ubuntu 16.04 LTS (Xenial Xerus) 

To install this on your system run commands in terminal

```sh
sudo add-apt-repository ppa:typematrix/bashmultitool
sudo apt update
sudo apt install bashmultitool
```

**or** Download latest fixed release and copy files manually as per file section table.

**or** Download latest fixed release  and run the makefile as per 
terminal commands below for version 1.0 latest release at time of writing

```sh
curl -sL https://github.com/gavinlyonsrepo/bashmultitool/archive/1.0.tar.gz | tar xz
cd  bashmultitool-1.0
sudo make install
```


Usage
-------------------------------------------
Source the library from your shell scripts

```sh
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done
```

To access functions from your shell scripts

```sh
BashMTFunc [keyword][options]
```

Files and setup
-----------------------------------------

| File Path | Description |
| ------ | ------ |
| /usr/lib/bashmultitool/bashmultitool  | library file |

Dependencies
-------------------------------------
The checknet section requires netcat installed. 

[Netcat](https://en.wikipedia.org/wiki/Netcat)

Features
----------------------
The library contains two functions.
An errorhandler function and the main one
BashMTFunc which contains 10 sections.

* Colored printed text 16 options
* Horizontal lines across terminal
* Yes-no-Quit prompt
* Anykey prompt
* Check website up
* Check package installed
* Make formated directory
* Linux distro family checker
* Animation for long non-verbose commands
* integer check

For full details see 
Features.md in documentation section 
[Features file](documentation/Features.md)

Return codes
---------------------
Returns code dependent on which section called.
The error Handler function returns 127 if called.


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
