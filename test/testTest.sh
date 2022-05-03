#!/bin/bash

# === HEADER ===

#Name: testTest.sh
#Description: File to run Automatic tests on library bashmultitool
#URL: https://github.com/gavinlyonsrepo/BashMultiTool

# === MAIN CODE ===
clear
printf "%s\n" "=== Start Automatic Tests === "
printf "%s\n"  "=== Start Print Tests === "  # Section 1
./testprint.sh
printf "%s\n"  "=== Start Prompt Tests === "  # Section 2
./testprompt.sh
printf "|\n%s\n"  "=== Start Network Tests === " # Section 3
./testnetwork.sh
printf  "\n%s\n"  "=== Start Linux  Tests === " # Section 4
./testlinux.sh
printf "\n%s\n"  "=== Start Files  Tests === " # Section 5
./testfile.sh
printf "\n%s\n"  "=== Start Data Tests === " # Section 6
./testdata.sh
printf "\n%s\n"  "=== Start Time Tests === " # Section 7
./testtime.sh
printf "\n%s\n"  "=== Start Misc Tests === " # Section 8
./testmisc.sh
printf "\n" 
# === EOF ===
