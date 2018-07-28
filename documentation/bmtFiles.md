| Library file | Function | Sections | Content | Doc link |
| ---- | ---- | ---- | ---- | ---- |
|  bmtFiles | bmtFilesFunc | 501-505 | File related | [bmtFiles help file](documentation/bmtFiles.md)|

501) Make formated directory

The keyword is makedir, First option is path , second is the text 
appended to end.

```sh
bmtFilesFunc makedir "/tmp/" "-TEST"
```

Output folders are created with following time/date stamp syntax 
HHMM-DDMONYY-X where X is text from third option. 
Makes the directory and cds into it
Returns 0 for success, 52 if in cannot access or create the directory
  
502) Does directory exist and is it empty

The keyword is isdirempty , the first option is path returns 0 for empty
 , 2 for not empty , 3 if it does not exist.

```sh
bmtFilesFunc isdirempty "$HOME/Desktop/TEST/file/"
```

503) directory exists

returns 0 for success, 2 for failure

```sh
bmtFilesFunc directoryexists /tmp/foo
```

504) file exists

returns 0 for success, 2 for failure

```sh
bmtFilesFunc fileexists /tmp/foo
```

505) device exists

returns 0 for success, 2 for failure

```sh
bmtFilesFunc deviceexists /dev/sda
```
