# Section Three, Network

| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
| bmtNetwork | bmtNetworkFunc | 301-310 | Network | bmtNetwork.md |

* 301 Check if a website is up
* 302 Weather forecast
* 303 Get public/external IP address
* 304 Get local IP address of a named interface
* 305 Resolve hostname to IP
* 306 Check if a TCP port is open on a host
* 307 Ping
* 308 Download a file
* 309 Active Network Interfaces
* 310 ssh check

## Sub-Sections

### 301 Check website up uses netcat utility

Keyword checknet, first option url of website. Returns 0 for connectivity , 2 for no connectivity

1. Param $2 The URL
2. Param $3 NOMES(optional) can be used to surpress verbose output.
3. Return 0 success / 2 fail

```sh
bmtNetworkFunc checknet "www.google.ie"
```

```sh
bmtNetworkFunc checknet "www.google.ie" "NOMES"
```

### 302 weather

Weather report by wttr.in, uses wget utility

1. Param $2 Type a City name, airport code, domain name or area code:-
2. Param $3 format 1-4
3. Return 0 success / 2 fail

```sh
bmtNetworkFunc weather Dublin 4
```

### 303 Get public/external IP address

Get public/external IP address, tool: curl icanhazip.com

1. Param $2: NOMES (optional) suppress output, result still returned via echo.
2. Return 0 success / 2 fail

```sh
bmtNetworkFunc publicip
```

### 304 Get local IP address of a named interface

Get local IP address of a named or default interface, tool: ip addr / hostname -I

1. Param $2: interface name (optional, defaults to first non-loopback interface).
2. Param $3: NOMES (optional) suppress output, result echoed for capture.
3. Return 0 success / 2 fail

```sh
bmtNetworkFunc localip
```

### 305 Resolve hostname to IP

Resolve hostname to IP (or IP to hostname), tool: dig / nslookup
Uses the 'host' utility which is part of bind-utils / dnsutils.

1. Param $2: hostname or IP to look up.
2. Param $3: NOMES (optional) suppress output, raw result echoed for capture.
3. Return 0 success / 2 fail

```sh
bmtNetworkFunc dnslookup www.google.com
```

### 306 Check if a TCP port is open on a host

Check if a TCP port is open on a host, tool: nc (netcat)
Uses netcat zero-I/O mode with a 3 second timeout.

1. Param $2: hostname or IP.
2. Param $3: port number.
3. Param $4: NOMES (optional) suppress output.
4. Return 0 success / 2 fail

```sh
bmtNetworkFunc portcheck "www.google.ie" 80
```

### 307 Ping

Ping a host N times, tool: ping

1. Param $2: hostname or IP.
2. Param $3: number of ping attempts (optional, default 4).
3. Param $4: NOMES (optional) suppress output.
4. Return 0 success / 2 fail

```sh
bmtNetworkFunc pingh "www.google.ie" 5
```

### 308 Download a file

Download a file to a destination with error handling, tool: wget / curl -O
Uses wget; falls back to curl if wget is not available.

1. Param $2: URL to download.
2. Param $3: destination directory or file path (optional, defaults to current dir).
3. Param $4: NOMES (optional) suppress progress output.
4. Return 0 success / 2 fail

```sh
bmtNetworkFunc download "https://icanhazip.com" "/tmp" "NOMES"
```

### 309 Active Network Interfaces

List active network interfaces and their IPv4 addresses, tool: ip -br addr

1. Param $2: NOMES (optional) suppress headers, output raw lines for parsing.
2. Return 0 success / 2 fail

```sh
bmtNetworkFunc netif
```

### 310 ssh check

Check if SSH port is reachable on a host

1. Param $2: hostname or IP.
2. Param $3: port number (optional, default 22).
3. Param $4: NOMES (optional) suppress output.

```sh
bmtNetworkFunc sshcheck "www.google.ie" 80
```
