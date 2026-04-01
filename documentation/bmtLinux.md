# Linux related functions section

| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
| bmtLinux | bmtLinuxFunc | 401-410 | Linux related | bmtLinux.md |

## Section Four, Linux

* 401 Check package installed
* 402 Linux distribution  family checker
* 403 Set text editor $EDITOR if not set
* 404 Log file handler
* 405 Check if user exists
* 406 Variable set and/or empty check
* 407 Run script as root check
* 408 Check if command exists in system
* 409 system information
* 410 Check if a named process is currently running

## Sub-Sections

### 401 Check package installed

Keyword is checkpac.

1. Param $2 package name
2. Param $3 type of linux distro (1 for pacman based, 2 for debian based, 3 for rpm based)
3. Param $4 to display message or not include "MES"
for verbose output.
4. Returns 0 for installed , 2 for not installed, returns 52 for unknown distro type.

```sh
bmtLinuxFunc  checkpac "firefox"  2  "MES"
```

### 402 Linux distro family checker

```sh
bmtLinuxFunc distrocheck
```

Returns 2-7 for known distro family groups or 52 for unknown.
(2 redhat based, 3 fedora based, 4 debian based, 5 pacman based,
6 gentoo based , 7 slackware based.)

### 403 Is text editor variable $EDITOR set?

```sh
bmtLinuxFunc isTextEdSet
```

returns 0 if it was set, 2 if not and sets it to vi

### 404 log file handler

Creates a log file entry with standard formated date/time stamp.

| Option | Option description |
| ---- | ---- |
| 1 State | valid states are EMERGENCY, ALERT, CRITICAL, ERROR,WARNING,NOTICE,INFO,DEBUG,OK,FAILED,PASSED  returns 55 for invalid state |
| 2 Message | if blank  message passed "-- empty log message" appended |
| 3 Filename | .log will be appended |
| 4 Path | path for log file |
| 5 Echo | if "MES" log message will also be echoed to console |

```sh
bmtLinuxFunc log "CRITICAL" "1201 alarm Executive overflow - no vacant areas" mylog /tmp/
bmtLinuxFunc log "CRITICAL" "1202 alarm Executive overflow - no core sets" mylog /tmp/
bmtLinuxFunc log "INFO" "62 Watchdog reset" mylog /tmp/ "MES"
```

### 405 Check if user exists

Check if user exist on system
Returns 0 if exists, 2 if not.

```sh
bmtLinuxFunc user "gavin"
echo "$?"
```

### 406 Check if variable is set and is empty

Returns 0  if set and non-empty, 2  if  set and empty ,  3 if unset

```sh
bmtLinuxFunc isvarempty variable_name
echo "$?"
```

### 407 Run Script as root check

Returns 2 if not running as root

```sh
bmtLinuxFunc runasroot
```

### 408 Check if command exists in system

Returns 2 if command does not exist on system.

```sh
bmtLinuxFunc iscommand tput
echo "$?"
```

### 409 System information

Prints system information to console, tool: uname -a

```sh
bmtLinuxFunc sysinfo
```

### 410 Check if a named process is currently running

Returns 0 if process is running, 2 if not.

```sh
bmtLinuxFunc proccheck "firefox"
echo "$?"
```
