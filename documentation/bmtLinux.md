| Library file | Function | Sections | Content | help file|
| ---- | ---- | ---- | ---- | ---- |
|  bmtLinux | bmtLinuxFunc | 401-404 | Linux related | bmtLinux.md |


401) Check package installed

Keyword is checkpac . First option is package name,
Second option is type of distro(options are 1 for pacman based, 2
for debian based, 3 for rpm based)
Third  option is wheter to display message or not include "MES" 
for verbose output

```sh
bmtLinuxFunc  checkpac "firefox"  2  "MES"
```

Returns 0 for installed , 2 for not installed , 
52 for unsupported linux distro

402) Linux distro family checker

```sh
bmtLinuxFunc distrocheck
```

Returns 2-7 for known distro family groups or 52 for unknown.
(2 redhat based, 3 fedora based, 4 debian based, 5 pacman based,
6 gentoo based , 7 slackware based.)

403) Is text editor variable $EDITOR set?

```sh
bmtLinuxFunc isTextEdSet
```

returns 0 if it was set, 2 if not and sets it to vi

404) log file handler
Creates a log file entry with standard formated date/time stamp.
First option is state, valid values are 
(EMERGENCY|ALERT|CRITICAL|ERROR|WARNING|NOTICE|INFO|DEBUG|OK|FAILED|PASSED)
second option is message, third option is file name .log is appended i.e mylog becomes mylog.log
Fourth option is path to file.

```sh
	bmtLinuxFunx log "CRITICAL" "1201 alarm Executive overflow - no vacant areas" mylog /tmp/
	bmtLinuxFunx log "CRITICAL" "1202 alarm Executive overflow - no core sets" mylog /tmp/
```
