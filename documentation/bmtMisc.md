| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  bmtMisc  | bmtMiscFunc  | 801-806  | Miscellaneous | bmtMisc.md |


**Section Eight , misc**

* 801 Password generator 
* 802 Get laptop battery level
* 803 Create a multi-line box with text inside it 
* 804 Create a single line box with variable box character. 
* 805 Centered text with variable banner character
* 806 Display gauge

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
3. The Rest of Params are the lines of text

```sh
bmtMiscFunc drawbox 1 2 'first line' 'second line' 'third line'
```

804) Create a single line box with variable box character. 
1. Param 1 color of box,  tput setaf 2=green
2. Param 2 color of text ,  tput setaf 6=cyan
3. Param 3 symbol to make the box lines out of.
4. Param 4 text

```sh
bmtMiscFunc title 2 6 '#' 'hello'
```

805) Centered text with option  banner filler
1. Param1 Text to center
2. Param2 Banner symbol 

```sh
bmtMiscFunc centertext "Hello World" =
```

806) Display Gauge, display a gauge bar showing variable value

1. Param1 Text label
2. Param2 Value to display
3. Param3 Minimum value of gauge
4. Param4 Maximum value of gauge
5. Param5 Gauge full symbol
6. Param6  Gauge empty symbol

```sh
bmtMiscFunc gauge  "Volts" 25 1 50 "#" "."
```
