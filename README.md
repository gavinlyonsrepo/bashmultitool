Overview
--------------------------------------------
* Name: bashMultiTool
* Description: 

A Bash Shell library file for commonly used functions
can be imported into shell scripts to create functional and colorful 
scripts and Terminal users interfaces(TUI).
The library allows user to redefine commonly used functions every time you write a shell script, the library may save a part of the development time.

* Author: Gavin Lyons
* GNU bash: version 5.1.16

Table of contents
---------------------------

  * [Installation](#installation)
  * [Usage](#usage)
  * [Software](#software)
  * [Example](#example)
  
Installation
-----------------------------------------------

**Linux debian based systems built on Ubuntu 22.04 LTS (Jammy Jellyfish)**
 
A Personal Package Archives (PPA) has been created on Ubuntu
package building and hosting section of launchpad site 
called bashmultitool.

To install this on your system run commands in terminal

```sh
sudo add-apt-repository ppa:typematrix/bashmultitool
sudo apt update
sudo apt install bashmultitool
```

**Arch based System** 

Package available in the Arch Linux user repo AUR

**For other linux systems**

Download latest fixed release and run the makefile as per 
terminal commands below for version 2.0 latest release at time of writing
Note: If you install with this method you will not be informed of updates 
by system.

```sh
curl -sL https://github.com/gavinlyonsrepo/bashmultitool/archive/2.0.tar.gz | tar xz
cd  bashmultitool-2.0
sudo make install
```

Usage
-------------------------------------------

Source the library functions from your bash shell scripts like so:

```sh
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done
```

To access library functions from your shell scripts type:

```sh
# [function-name] [keyword] [options]
# eg

bmtPrintFunc b_red "Hello World"
 ```

Software
-----------------------------------------

Eight separate markdown help files with detailed information, 
in documentation folder are available.
For shortcut to each help file click on link in 2nd table in *software* section below. The repo also contains a *test folder* where test files used in development are available, one for each library file.
A script to print library meta data is also installed.

| Installed File Path | Description |
| ------ | ------ |
| /usr/bin/bashmultitool | Script to print library meta data |
| /usr/lib/bashmultitool/bashmultitool/*  | 8 library files see next table|
| /usr/lib/bashmultitool/doc/README.md   | readme  |  
| /usr/lib/bashmultitool/doc/bmt*.md | 8 Documentation files see next table | 

| Library file | Function | Sections | Content | Doc link |
| ---- | ---- | ---- | ---- | ---- |
|  bmtPrint | bmtPrintFunc | 101 | Printing text | [bmtPrint help file](documentation/bmtPrint.md)|
|  bmtPrompt | bmtPromptFunc | 201-210 | Prompts | [ bmtPrompt help file](documentation/bmtPrompt.md)|
|  bmtNetwork  | bmtNetworkFunc  | 301-302 | Network related | [bmtNetwork help file](documentation/bmtNetwork.md)|
|  bmtLinux | bmtLinuxFunc | 401-408 | Linux related | [bmtLinux help file](documentation/bmtLinux.md)|
|  bmtFiles | bmtFilesFunc | 501-509 | File related | [bmtFiles help file](documentation/bmtFiles.md)|
|  bmtData | btmDataFunc | 601-607 | Data related | [bmtData help file](documentation/bmtData.md)|
|  bmtTime | btmTimeFunc | 701-709 | Time related | [bmtTime help file](documentation/bmtTime.md)|
|  bmtMisc  | bmtMiscFunc  | 801-804 | Miscellaneous | [bmtMisc help file](documentation/bmtMisc.md)|
|  bmtTest  | bmtTestFunc  | 901 |  Test the library | [bmtTest help file](documentation/bmtTest.md)|

The library contains eight section's, Each section has one file with one function. 
Which contains 50 sub-sections in total.
The sections are grouped per logical function.
Printing, prompting, Linux related, file related, 
data related, time related , network related and miscellaneous.
The sections are mostly independent of each other
you can source them individually if you wish, however the prompt file *is* 
dependent on print. Each file has one function,

Example
----------------------------

Output of basic example file in example folder, showing basic usage.

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/example.png)

Output report of test section.

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/test.png)
