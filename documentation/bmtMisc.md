|| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  bmtMisc  | bmtMiscFunc  | 801-802  | Miscellaneous | bmtMisc.md |


**Section Eight , misc**

* 801 Password generator 
* 802 Get laptop battery level

**Sub-Sections**

801)  Password generator 
Generates a random password in passwordBMT.txt, returns 0 for success.
Prompts user for length of password. Optional path can be added, if no path added 
file passed in /tmp/.

```sh
bmtMiscFunc password "/home/foo"
```

802) Return laptop battery level
* Return 0-100 , % of battery remaining , 127 and 128 file errors
* Param 1 Battery name, BAT0 or BAT1 at /sys/class/power_supply
* Param 2 "MES" or blank , if exist print message

```sh
bmtMiscFunc getbatlevel "BAT0" "MES"
echo "$?"
```
803) Create a multi-line box with text inside it 

1. Param1 color of box , tput setaf , 1 = red
2. Param2 color of text  , tput setaf , 2 = green
3. Rest of Params the lines of text

```sh
bmtMiscFunc drawbox 1 2 'first line' 'second line' 'third line'
```

804) Create a single line box with variable box character. 
1. Param 1 color of box,  tput setaf 2=green
2. Param 2 color of text ,  tput setaf 6=cyan
2. Param2 symbol top make box out of.
3. Param3 text

```sh
bmtMiscFunc title 2 6 '#' 'hello'
```
