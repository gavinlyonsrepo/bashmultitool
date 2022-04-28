| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  bmtPrint | bmtPrintFunc | 101 | Printing text | bmtPrint.md |

**Section One  , Printing**

* 101 Coloured printed text, 8 colours, 7 modes. 56 options in total.

Colours: Black, Red, Green, Yellow, Blue, Purple, Cyan, White.

Modes: normal, bold, underline, background, high intensity,
bold high intensity, background high intensity.  


**Sub-Sections**

101) Colored printed text  

The keyword represent the color, the text to be printed is first option.
leave text option blank to just change the colour mode of cursor

```sh
bmtPrintFunc red    # change colour, no output.
echo "red text"
bmtPrintFunc norm "default terminal text"

bmtPrintFunc black "black"
bmtPrintFunc red "red"
bmtPrintFunc green "green"
bmtPrintFunc yellow "yellow" 
bmtPrintFunc blue "blue "
bmtPrintFunc purple "purple"
bmtPrintFunc cyan "cyan"
bmtPrintFunc white "white" 
bmtPrintFunc b_black "bold black "
bmtPrintFunc b_red "bold red  "
bmtPrintFunc b_green "bold green  "
bmtPrintFunc b_yellow "bold yellow  "
bmtPrintFunc b_blue "bold blue  "
bmtPrintFunc b_purple "bold purple  "
bmtPrintFunc b_cyan "bold cyan  "
bmtPrintFunc b_white "bold white  "
bmtPrintFunc u_black "underline black "
bmtPrintFunc u_red "underline red  "
bmtPrintFunc u_green "underline green  "
bmtPrintFunc u_yellow "underline yellow  "
bmtPrintFunc u_blue "underline blue  "
bmtPrintFunc u_purple "underline purple  "
bmtPrintFunc u_cyan "underline cyan  "
bmtPrintFunc u_white "underline white  "
bmtPrintFunc bg_black "background black "
bmtPrintFunc bg_red "background red  "
bmtPrintFunc bg_green "background green  "
bmtPrintFunc bg_yellow "background yellow  "
bmtPrintFunc bg_blue "background blue  "
bmtPrintFunc bg_purple "background purple  "
bmtPrintFunc bg_cyan "background cyan  "
bmtPrintFunc bg_white "background white  " 
bmtPrintFunc i_black "high intensity black " 
bmtPrintFunc i_red "high intensity red  "
bmtPrintFunc i_green "high intensity green  "
bmtPrintFunc i_yellow "high intensity yellow  "
bmtPrintFunc i_blue "high intensity blue  "
bmtPrintFunc i_purple "high intensity purple  "
bmtPrintFunc i_cyan "high intensity cyan  "
bmtPrintFunc i_white "high intensity white  "
bmtPrintFunc bh_black "high intensity bold black " 
bmtPrintFunc bh_red "high intensity bold red  "
bmtPrintFunc bh_green "high intensity bold green  "
bmtPrintFunc bh_yellow "high intensity bold yellow  "
bmtPrintFunc bh_blue "high intensity bold blue  "
bmtPrintFunc bh_purple "high intensity bold purple  "
bmtPrintFunc bh_cyan "high intensity bold cyan  "
bmtPrintFunc bh_white "high intensity bold white  "
bmtPrintFunc hbg_black "high intensity background black " 
bmtPrintFunc hbg_red "high intensity background red  "
bmtPrintFunc hbg_green "high intensity background green  "
bmtPrintFunc hbg_yellow "high intensity background yellow  "
bmtPrintFunc hbg_blue "high intensity background blue  "
bmtPrintFunc hbg_purple "high intensity background purple  "
bmtPrintFunc hbg_cyan "high intensity background cyan  "
bmtPrintFunc hbg_white "high intensity background white  " 
```

**Example Output:**

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/colour_print_example.png)

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/output_test_print.png)
