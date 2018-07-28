| Library file | Function | Sections | Content | Doc link |
| ---- | ---- | ---- | ---- | ---- |
|  bmtPrompt | bmtPromptFunc | 201-207 | Prompts | [ bmtPrompt help file](documentation/bmtPrompt.md)|


201) Horizontal lines across terminal of single character

Keyword is line, first option the character, second option is colour,
if no colour passed default is "bold cyan"

```sh
	bmtPromptFunc line    "=" 
	bmtPromptFunc line    "8" red
```

202) yes-no-quit prompt y/n/q

Keyword is yesnoquit , returns codes based on user input

```sh
echo  "Do you want to foo? [y/n/q] :"
bmtPromptFunc yesno
```
Returns 0 for yes , 2 for no , 3 for quit

203) Yes-no prompt [Y/n] where yes is default

Keyword is yesno , returns codes based on user input
second option yes for yes default

```sh
echo "Do you want to foo? [Y/n] :"
bmtPromptFunc yesno yes
```
Returns 2 for yes , 0 for no , 50 for bad user option

204) Yes-no prompt [y/N] where no is default

Keyword is yesno , returns codes based on user input
second option is no for no default

```sh
echo "Do you want to foo? [y/N] :"
bmtPromptFunc yesno no
```
Returns 2 for no , 0 for yes , 50 for bad user option

205) QUIT-no prompt [Q/n] where quit is default

Keyword is quitno , returns codes based on user input
second option quit for quit default

```sh
echo "Do you want to foo? [Q/n] :"
bmtPromptFunc quitno quit
```
Returns 2 for quit , 0 for no , 50 for bad user option

206) quit-NO prompt [q/N] where no is default

Keyword is quitno , returns codes based on user input
second option no for no default
```sh
echo "Do you want to foo? [q/N] :"
bmtPromptFunc quitno no
```
Returns 2 for no , 0 for quit , 50 for bad user option

207) Anykey prompt

Keyword is anykey , first option amended text, second option is colour,
if no colour passed default is "bold cyan"

```sh
bmtPromptFunc anykey "my Text here"
bmtPromptFunc anykey "my Text here" u_red
```

