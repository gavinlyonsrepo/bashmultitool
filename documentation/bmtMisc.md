| Library file | Function | Sections | Content | Doc link |
| ---- | ---- | ---- | ---- | ---- |
|  bmtMisc  | bmtMiscFunc  | 301-303  | Miscellaneous | [bmtMisc help file](documentation/bmtMisc.md)|

301) Check website up

Keyword checknet, first option url of website. Returns 0 for connectivity , 2 for no connectivity 

```sh
bmtMiscFunc checknet "www.google.ie"
```

302) Animation for non-verbose process/commands that take long time

```sh
	# call spinner section put run in background and save PID
	bmtMiscFunc  spin &
	pid=$!
	disown
	
	# 'do stuff'
	echo "START"
	find ~ -name mint 2>/dev/null 
	echo "END"
	
	# Stop spin function with PID
	kill $pid 
	sleep 2
```

303) Stop watch

Stop watch timer that returns value in seconds between the stop and start
with a scale of 6. Mircoseconds  1.000000.
startwatch creates a global variable called __BMT_START_WATCH
and uses bc - An arbitrary precision calculator language.

```sh
bmtMiscFunc startWatch
sleep 2.8
bmtMiscFunc stopWatch
# returns  ~ 2.813207
```
