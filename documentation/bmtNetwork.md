| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  bmtNetwork | bmtNetworkFunc  | 301-302  | Network | bmtNetwork.md |

**Section Three, Network**

* 301 Check if a website is up
* 302 Weather forecast

**Sub-Sections**

301) Check website up uses netcat utility 

Keyword checknet, first option url of website. Returns 0 for connectivity , 2 for no connectivity 

```sh
bmtNetworkFunc checknet "www.google.ie"
```

302) weather
 
Weather report by wttr.in, uses wget utility 

1. Param1 Type a City name, airport code, domain name or area code:-
2. Param2 format 1-4

```sh
bmtNetworkFunc weather Dublin 4
```
