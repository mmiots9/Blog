---
title: "How to remember all keyboard shortcuts"
h1title: "Addshort e searchshort: shortcuts remember functions"
subtitle: "How to store shortcuts in a file and retrieve them"
date: 2021-08-10
modified: 
description: "Write and retrieve shortcut from a file"
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: true
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- Bash
- Shortcut
series:
- My bash functions
categories:
- Bash
image: "/images/Bash/addshort_searchshort/shortcut.jpg"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Can't remember all the shortcuts there are for a program or for your pc? You are not the only one!
There are so many shortcuts that it is impossible to remember them all, it is normal. Tired of having to look for them every time on the internet, I decided to create various files to mark them all, divided by program/application I use (for example I have Mac, Terminal, VSCode and RStudio).
I also felt the need to find a quick way both to add the shortcuts (without having to look for the file somewhere), and to search for them; for this reason I have written two very simple bash functions, which allow me to perform all these operations from the terminal.
Let's see them in detail, remembering that these functions can be found in the corresponding [repo](https://github.com/mmiots9/bash-functions) on github, in the *cheat_short.sh* file.

## Addshort
The first function, for obvious reasons, is the one that allows us to add shortcuts to files.

There are a couple of premises to make.
The file in which you want to add the shortcut is divided into 2 or 3 columns separated by tabs. If you want to add column names (for example "command" and "what it does"), you have to do it by dividing them with tabs.
But, why am I talking about 2 or 3 columns? Being Italian and Italian being my mother tongue, I decided to create the function in such a way that 3 columns are created: command, what it does (in Italian) and what it does (in English). In case you do not want the column of your native language and you want to use only the English one, the function foresees this change by opening the code and following the steps indicated in the comments. In this case, the columns will be 2.
If you are using multiple files, they must have the same extension and be in the same folder.

### Settings
Let's see what needs to be done once the function file has been downloaded.
The first thing to do is to open the file with a text editor to set some basic parameters:
<figure id="settaggi_iniziali">
  <img src="/images/Bash/addshort_searchshort/addsh2set.png" alt="First settings" width=80%>
  <figcaption style="text-align:center;">Figure 1: initial settings for addshort and searchshort functions</figcaption>
</figure>

***arr***: array of filenames, <u>without</u> extension and path
***ext***: file extension
***filepath***: the path of the folder where the files are, I highly recommend putting the full path from the home directory
***whatdoes***: if you want to have the column of your language, this will be the string corresponding to the question "What it does?" (what the shortcut does) which will be placed in the terminal.

The other change to make is to comment and uncomment the lines relating to the possibility of dual language, according to your needs (see figure below).
<img src="/images/Bash/addshort_searchshort/comment-uncommentadd.png" alt="Second language settings" width=80%>

### Function command
Now, after having added the function file in the terminal path, we are ready to run it with the *addshort* command.

<div style="text-align:center">
<video height=300px width=auto controls>
  <source src="/images/Bash/addshort_searchshort/addshort.mov">
</video>
</div>

<p style="margin-bottom:0;">The video above show the various steps:</p>
<ol>
<li>In which file should the shortcut be added? </li>
<li>Enter the shortcut: at this moment, the function <b>checks</b> if it already exists, in that case it stops and communicates this to the user </li>
<li>Enter what it does in the native language </li>
<li>Enter what it does in English </li>
<li>Ask if you want to add another shortcut to the same file </li>
</ol>

At the end, the function adds this information to the selected file.

## Searchshort
This function allows you to search for a shortcut that you do not remember, by entering keywords. The function itself is very simple: it is like a grep that you can run it from whatever directory you are in.

### Settings
Also in this case, there are some settings to implement: the same as in the previous function (see figure <a href="#settaggi_iniziali">1</a>).

Moreover, it is necessary to comment or uncomment a couple of commands, based on the presence or absence of the second language.
<img src="/images/Bash/addshort_searchshort/comment-uncommentsearch.png" alt="Second language settings" width=80%>

### Function command
As before, having added the function file in the path, launch it with the *searchshort* command.

<div style="text-align:center">
<video height=300px width=auto controls>
  <source src="/images/Bash/addshort_searchshort/searchshort.mov">
</video>
</div>

As you can see from the video, the procedure is very immediate: you choose which file to search for the shortcut and enter the keywords.
**N.B.:** Words do not need to be in right order!

If there are no results with that combination of words, a message will be prompted. You must therefore either try again with another combination, or enter that shortcut before looking for it.

## Conclusions
I hope this short guide on using these two simple functions is clear and useful.
As you will see from the code, there is not always a need to create super complicated and cumbersome functions, sometimes simplicity pays off.


</div>