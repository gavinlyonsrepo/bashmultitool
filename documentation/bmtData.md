
| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  bmtData | btmDataFunc | 601-607 | Data related | bmtData.md|

**Section Six, Data**

* 601 integer user input check
* 602 alphabet user input check
* 603 alphanumeric user input check
* 604 convert string to lowercase
* 605 convert string to uppercase
* 606 trim white space from string
* 607 String Length 

**Sub-Sections**

601) integer input check

Keyword intcheck, first option the item to be checked if integer

```sh
bmtDataFunc intcheck "$age"
```

Returns 0 for integer , 2 for non integer.

602) Alphanumeric input check

Keyword alphanumcheck, first option the item to be checked if Alphanumeric

```sh
bmtDataFunc alphanumcheck "$address"
```

Returns 0 for alphanumcheck , 2 for non alphanumcheck.

603) alphabet input check

Keyword alphacheck) , first option the item to be checked if alphabet

```sh
bmtDataFunc alphacheck "$name"
```

Returns 0 for alphabet , 2 for non alphabet.

604)  convert a string to lowercase

```sh
result=$(bmtDataFunc lowercase "TEST")   
echo $result
```

605)   convert a string to uppercase

```sh
result=$(bmtDataFunc upperrcase "test")   
echo $result
```

606) trim whitespace from a strin

```sh
result2=$(bmtDataFunc trim "       test   "
echo $result2
```

607) String Length 
Returns string length , maximum 249 , 250 is Null string error.

```sh
bmtDataFunc strlen "test string 123" #15
echo $?
```
