---
title: "Bash diary"
h1title: "Diary functions: create a diary of the terminal functions"
date: 2021-10-06
modified: 
description: "Salavre porzioni di history in un file separato"
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: true
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- Bash
- Diary
- Terminal
- Zsh
series:
- My bash functions
categories:
- Bash
image: "/images/Bash/diary/diary.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Today, I'll talk about how to create a "diary" of the commands launched on the terminal. We all know that with the `history` command we can see recently launched commands, and that there is also a file (.bash_history or .zsh_history, depending on which shell you are using); **but**, often you only want to have a portion of the history.
More precisely, we want to create what in other languages and on other platforms is called *diary*: to be more specific, "ok, from here on record the commands I write and save in another file". It is often used to keep track of a job, an analysis, or to keep the work done in a day, etc.
This, at the moment, cannot be done with the terminal. For this reason, I decided to create a couple of functions that allow us to do this: *diarystart* and *diaryend*.
Let's see how they work.

## Diarystart
This function must be launched when you want to start recording subsequent commands.
Its form is very simple: `diarystart filename`. The *filename* is the name of the file in which the commands will be saved (it can also contain a path) and must always be specified.
By now, the file is <u>not</u> created yet.

<p style="margin-bottom:0;">There are 2 things to take into account:</p>
<li> <b>never</b> use a filename that already exists on the machine, as the next command would overwrite it</li>
<li> <b>never</b> create an alias for this function, as the next one looks for the last <i>diarystart</i> command in the history. If you really want to create an alias, modify the diaryend function accordingly</li>
  
At this point, you are free to execute the commands of interest and work on the terminal.

## Diaryend
Once you are done working and want to save the history of the commands after diarystart, you run the `diaryend` command by itself. This function will create a file (the one specified in diarystart) in which there will be a list of the commands used.
A peculiarity of this pair of functions is that if you forget to launch diaryend at the end of the day, you can easily launch it at the beginning of the next day.

## Example
Below is a small example of how these functions work:

<div style="text-align:center">
<video height=300px width=auto controls>
  <source src="/images/Bash/diary/diary.mov">
</video>
</div>





</div>