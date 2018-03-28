#!/bin/bash

#=========================HEADER==========================================
#name: testprint.sh
#Description: test file for bashmultitool for file bmtprint
#Written : Gavin Lyons

#====================FUNCTIONS===============================
#Source the lib
LIBPATH="/home/gavin/Documents/Tech/Linux/Scripts/BashMultiTool/lib/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done

function Test_Func
{

#error handling check(catch typos)
echo  "Error handling"
bmtPrintFunc foo

#print text
	     
	#reg 1
	echo ""
	bmtPrintFunc norm "reg colours"
	echo ""
	bmtPrintFunc black "black"
	bmtPrintFunc red "red "
	bmtPrintFunc green "green "
	bmtPrintFunc yellow "yellow" #tan
	bmtPrintFunc blue "blue "
	bmtPrintFunc purple "purple "
	bmtPrintFunc cyan "cyan "
	bmtPrintFunc white "white  " #light grey
	
	#bold 2
	echo ""
	bmtPrintFunc norm "bold colours"
	echo ""
	bmtPrintFunc b_black "bold black " #dark grey
	bmtPrintFunc b_red "bold red  "
	bmtPrintFunc b_green "bold green  "
	bmtPrintFunc b_yellow "bold yellow  "
	bmtPrintFunc b_blue "bold blue  "
	bmtPrintFunc b_purple "bold purple  "
	bmtPrintFunc b_cyan "bold cyan  "
	bmtPrintFunc b_white "bold white  "
	
	# underline 3
	echo ""
	bmtPrintFunc norm "underline colours"
	echo ""
	bmtPrintFunc u_black "underline black "
	bmtPrintFunc u_red "underline red"
	bmtPrintFunc u_green "underline green  "
	bmtPrintFunc u_yellow "underline yellow  "
	bmtPrintFunc u_blue "underline blue  "
	bmtPrintFunc u_purple "underline purple  "
	bmtPrintFunc u_cyan "underline cyan  "
	bmtPrintFunc u_white "underline white  "

	# background  4
	echo ""
	bmtPrintFunc norm "background colours"
	echo ""
	bmtPrintFunc bg_black "background black "
	bmtPrintFunc bg_red "background red  "
	bmtPrintFunc bg_green "background green  "
	bmtPrintFunc bg_yellow "background yellow  "
	bmtPrintFunc bg_blue "background blue  "
	bmtPrintFunc bg_purple "background purple  "
	bmtPrintFunc bg_cyan "background cyan  "
	bmtPrintFunc bg_white "background white  " #very light grey
			
	# high intensity bold 5
	echo ""
	bmtPrintFunc norm "high intensity  colours"
	echo ""
	bmtPrintFunc i_black "high intensity black " #very dark grey
	bmtPrintFunc i_red "high intensity  red  "
	bmtPrintFunc i_green "high intensity  green  "
	bmtPrintFunc i_yellow "high intensity  yellow  "
	bmtPrintFunc i_blue "high intensity blue  "
	bmtPrintFunc i_purple "high intensity purple  "
	bmtPrintFunc i_cyan "high intensity cyan  "
	bmtPrintFunc i_white "high intensity white  "
	
	# high intensity bold 6
	echo ""
	bmtPrintFunc norm "high intensity bold  colours"
	echo ""
	bmtPrintFunc bh_black "high intensity bold black " #very dark grey
	bmtPrintFunc bh_red "high intensity bold red  "
	bmtPrintFunc bh_green "high intensity bold green  "
	bmtPrintFunc bh_yellow "high intensity bold yellow  "
	bmtPrintFunc bh_blue "high intensity bold blue  "
	bmtPrintFunc bh_purple "high intensity bold purple  "
	bmtPrintFunc bh_cyan "high intensity bold cyan  "
	bmtPrintFunc bh_white "high intensity bold white  "
	
	# high intensity bold 7
	echo ""
	bmtPrintFunc norm "high intensity background colours"
	echo ""
	bmtPrintFunc hbg_black "high intensity background black " #light grey
	bmtPrintFunc hbg_red "high intensity background red  "
	bmtPrintFunc hbg_green "high intensity background green  "
	bmtPrintFunc hbg_yellow "high intensity background yellow  "
	bmtPrintFunc hbg_blue "high intensity background blue  "
	bmtPrintFunc hbg_purple "high intensity background purple  "
	bmtPrintFunc hbg_cyan "high intensity background cyan  "
	bmtPrintFunc hbg_white "high intensity background white  " # very light grey

}

#==================MAIN CODE=============================
Test_Func
#====================== END ==============================
