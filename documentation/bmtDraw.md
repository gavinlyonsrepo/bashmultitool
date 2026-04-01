# Section Nine, Draw and display related functions

| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
| bmtDraw | bmtDrawFunc | 901-907 | Draw related | bmtDraw.md |

## Section Nine, draw sub sections

* 901 Create a multi-line box with text inside it
* 902 Create a single line box with variable box character.
* 903 Centered text with variable banner character
* 904 Display gauge
* 905 Table
* 906 Menu
* 907 Columns

### 901 Create a multi-line box with text inside it

1. Param $2 color of box , tput setaf , 1 = red
2. Param $3 color of text  , tput setaf , 2 = green
3. The Rest of Params are the lines of text

```sh
bmtDrawFunc drawbox 1 2 'first line' 'second line' 'third line'
```

### 902 Create a single line box with variable box character

1. Param $2 color of box,  tput setaf 2=green
2. Param $3 color of text ,  tput setaf 6=cyan
3. Param $4 symbol to make the box lines out of.
4. Param $5 text

```sh
bmtDrawFunc title 2 6 '#' 'hello'
```

### 903 Centered text with option  banner filler

1. Param $2 Text to center
2. Param $3 Banner symbol

```sh
bmtDrawFunc centertext "Hello World" =
```

### 904 Display Gauge, display a gauge bar showing variable value

1. Param $2 Text label
2. Param $3 Value to display
3. Param $4 Minimum value of gauge
4. Param $5 Maximum value of gauge
5. Param $6 Gauge full symbol
6. Param $7 Gauge empty symbol

```sh
bmtDrawFunc gauge  "Volts" 25 1 50 "#" "."
```

### 905 table

1. Param $2 colour for the border/keys (tput colour number).
2. Param $3 colour for the values (tput colour number).
3. Param $4 onwards as flat alternating key-value pairs e.g. "OS" "Linux" "Uptime" "3 days"

```sh
bmtDrawFunc table 2 6 "OS" "Linux" "Uptime"
```

### 906 menu

1. Param $2 colour for the menu border and numbers (tput colour number).
2. Param $3 colour for the menu item text (tput colour number).
3. Param $4 prompt string shown to user below the list.
4. Param $5 onwards as menu item strings, one per argument.
5. Three distinct return codes: the chosen number 1–N on valid input, 253 for non-integer input, 254 for out-of-range.

```sh
bmtDrawFunc menu 3 2 "Choose an option:" "Start" "Stop" "Restart" 
choice=$?
if [ "$choice" -eq 253 ]; then
    echo "Invalid input: not a number"
elif [ "$choice" -eq 254 ]; then
    echo "Invalid input: number out of range"
else
    echo "You chose option $choice"
fi
```

### 907 cols

Prints a list of items across a specified number of evenly spaced columns, with column width calculated from the longest item and fitted to terminal width.

1. Param $2 number of columns.
2. Param $3 colour for the items (tput colour number).
3. Param $4+ onwards as items to display.
4. Returns 1 if column count is missing or not a positive integer.

```sh
bmtDrawFunc cols 3 4 "alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta"
# This will display the 7 items across 3 columns with color 4 (blue)
# alpha    beta     gamma
# delta    epsilon  zeta
# eta
```
