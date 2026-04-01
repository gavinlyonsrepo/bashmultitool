# Section Eight , miscellaneous section

| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
| bmtMisc | bmtMiscFunc | 801-802 | Miscellaneous | bmtMisc.md |

## Section Eight,  Miscellaneous sub sections

* 801 Password generator
* 802 Get laptop battery level

### 801  Password generator

Generates a random password in passwordBMT.txt, returns 0 for success.
Prompts user for length of password. Optional path can be added,
if no path added file passed in /tmp/.

```sh
bmtMiscFunc password "/home/foo"
```

### 802 Return laptop battery level

* Return 0-100 , % of battery remaining , 127 and 128 file errors
* Param 1 Battery name, BAT0 or BAT1 at /sys/class/power_supply
* Param 2 "MES" or blank , if exist print message

```sh
bmtMiscFunc getbatlevel "BAT0" "MES"
echo "$?"
```
