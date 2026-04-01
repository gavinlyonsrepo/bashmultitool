# Data Section

| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
| bmtData | btmDataFunc | 601-610 | Data related | bmtData.md |

## Data section 601-610

* 601 integer user input check
* 602 alphabet user input check
* 603 alphanumeric user input check
* 604 convert string to lowercase
* 605 convert string to uppercase
* 606 trim white space from string
* 607 String Length
* 608 Contains string check
* 609 String Replace
* 610 String Reverse

### 601 integer input check

Keyword intcheck, first option the item to be checked if integer

```sh
bmtDataFunc intcheck "$age"
```

Returns 0 for integer , 2 for non integer.

### 602 Alphanumeric input check

Keyword alphanumcheck, first option the item to be checked if Alphanumeric

```sh
bmtDataFunc alphanumcheck "$address"
```

Returns 0 for alphanumcheck , 2 for non alphanumcheck.

### 603 alphabet input check

Keyword alphacheck) , first option the item to be checked if alphabet

```sh
bmtDataFunc alphacheck "$name"
```

Returns 0 for alphabet , 2 for non alphabet.

### 604  convert a string to lowercase

```sh
result=$(bmtDataFunc lowercase "TEST")   
echo $result
```

### 605   convert a string to uppercase

```sh
result=$(bmtDataFunc upperrcase "test")   
echo $result
```

### 606 trim whitespace from a strin

```sh
result2=$(bmtDataFunc trim "       test   "
echo $result2
```

### 607 String Length

Returns string length , maximum 249 , 250 is Null string error.

```sh
bmtDataFunc strlen "test string 123" #15
echo $?
```

### 608 Contains string check

Check if string contains a given substring

1. Param $2 is the string to search within
2. Param $3 is the string to search for
3. Returns 1 for missing params, 0 if found, falls through to the function-level return of 2 for not-found.

```sh
bmtDataFunc contains "This is a test string" "test"
```

### 609 replace string

Replace first (or all) occurrences of a pattern in a string; returns result via echo

1. Param $2 is the input string
2. Param $3 is the pattern to replace
3. Param $4 is the replacement string (can be empty to delete)
4. Param $5 is the optional ALL flag; if set to "ALL", all occurrences of the pattern will be replaced, otherwise only the first occurrence is replaced.
5. Returns 1 if Param $2 or Param $3 is missing.

```sh
# replace all occurrences
result4=$(bmtDataFunc strreplace "hello world world" "world" "bash" "ALL")
printf  "%s\n" "$result4"   # expect: hello bash bash
```

### 610 Reverse a string

Reverse a string, returns result via echo. tool: rev, which is part of util-linux and present on all Linux systems

1. Param $2 is the input string
2. Returns 1 if Param $2 is missing , otherwise returns 0 andthe reversed string via echo.

```sh
result6=$(bmtDataFunc strrev "hello")
printf  "%s\n" "$result6"   # expect: olleh
```
