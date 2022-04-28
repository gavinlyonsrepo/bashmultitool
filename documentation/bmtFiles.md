| Library file | Function | Sections | Content | help file|
| ---- | ---- | ---- | ---- | ---- |
|  bmtFiles | bmtFilesFunc | 501-508 | File related | bmtFiles.md |

**Section Five,  File**

* 501 Make and enter a formatted directory
* 502 Check if directory exists and empty
* 503 Directory exists
* 504 File exists
* 505 Device exists
* 506 File empty
* 507 File size 
* 508 File size in bytes

**Sub-Sections**

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

506) Empty File
Check if file empty
returns 0 if not empty , 2 if empty

```sh
bmtFilesFunc isfileempty "/foo/foo.txt"
echo $?
```

507) File size 
Prints file size and returns 0 if file does not exist returns 2
```sh
bmtFilesFunc getfilesize "/foo/foo.txt"
```

508) File Size in bytes 
Prints file size and returns 0 if file does not exist returns 2
```sh
bmtFilesFunc getfilesizebytes "/foo/foo.txt"
```

509) Display mime type of input file
Returns 4 If file/directory does not exist. , 3 If file or mimetype command not found in system.
2 if missing arguments.

```sh
echo "$(bmtFilesFunc getmimetype "$TESTOBJECTS/full.txt")" >> /tmp/mytempfile123.txt
echo $?
```
