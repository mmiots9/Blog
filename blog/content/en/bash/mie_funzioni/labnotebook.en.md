---
title: "Create a bioinformatic lab notebook"
h1title: "Create a bioinformatic lab notebook"
subtitle: "How to create a laboratory notebook as bioinformatician"
date: 2022-03-16
description: "How to create a laboratory notebook as bioinformatician"
draft: false
hideToc: false
enableToc: true
enableTocContent: false
tocFolding: true
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- Bash
- Git
- Terminal
- Zsh
- Lab notebook
- Bioinformatician
- Diary
series:
- My bash functions
categories:
- Bash
image: "/images/Bash/Labnotebook.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Today we'll talking about the <i>labnotebook</i> project, born from the need to compile a laboratory notebook automatically, quickly and systematically.
For the uninitiated, in research laboratories it is mandatory to keep track of everything that is done through notebooks called "laboratory notebooks"; the nature of the work of a bioinformatician, however, is very different from that of those at the bench, therefore also the possibility of keeping track of what has been done is.
Many will know git or other version control systems, that are systems that allow you to have a trace of all the changes made to a file, having a history. To access this history, one must have mastery of these systems, which makes it difficult (if not impossible) to read these informations for those who do not use them.
For this reason, I decided to create a package of functions that allow you to transform this history into an html file, which can be customized, easy to export and share. You can find these functions in this <a href="https://github.com/mmiots9/labnotebook" target="_blank">repo</a> on github.

<div class="notices warning" data-title="Important" style="margin:0px;">
<p>To take advantage of these features, you need to have git installed, that the project you are working on is under the control of git, and that the commits are compiled thoroughly.</p>
</div>

## Notebook structure
The notebook is structured as follows:
As a header there is the name of the notebook, followed by the creation date and the author (taken from the git config file),
Subsequently, for each date we have the list of commits (therefore of the actions carried out) with specified what has been done, the sha of the commit, eventually the file containing the list of executed commands/analyses made, and the list of modified files, indicating whether they have been added (A), modified (M), deleted (D) or renamed (R).

You can find an example <a href="../example.html" target="_blank">here</a>.

## Create a notebook
To create a notebook, just be in the project folder where the <code>.git/</code> folder is located and launch the <code>createnotebook \<name_notebook\></code> command.
You will be asked if the .labnotebook folder that will be created should be ignored by git (so if it must be inserted inside the .gitignore file); from that moment the .labnotebook folder will be present where the .git one is located.
<p style="margin-bottom: 0px;">Inside the folder we find various files: </p>
<li> config: file of configuration, more on that in a little while </li>
<li> labstyle.css: basic css file that controls the style of the html file that is created when exporting the notebook. We'll talk about this too soon </li>
<li> head.html: file containing part of the head of the html file </li>
<li> body.html: file that contains the body of the html file, it will be constantly updated </li>
<li> footer.html: file that contains the last part of the html file </li>

## Config file
The config file contains some starting settings that can be changed if necessary, being careful not to compromise the functionality of the notebook update and notebook export functions.
<p style="margin-bottom: 0px;"> Let's see the info contained: </p>
<li> NOTEBOOK_NAME: name of the notebook </li>
<li> LAST_COMMIT: contains the sha of the last commit inserted in the notebook. As soon as the notebook is created, the value will be set to "no"; it will be updated after each update. It is advisable to modify this entry <b>only</b> if strictly necessary (for example if the last commit is no longer in the history) </li>
<li> LAB_AUTHOR: name of the author of the notebook </li>
<li> LAST_DAY: the date of the last commit in the notebook </li>
<li> SHOW_ANALYSIS_FILES: defaults to "yes" and indicates for each commit to add an entry indicating which is the command/analysis file. You can change it by entering "no" and no entry will not be added </li>
<li> LAB_CSS: path of the css file that controls the style of the notebook. You can change it if you want to use a different style using your own css file </li>
<li> LAB_IGNORE: indicates if the .labnotebook folder is inserted in .gitignore "yes" or not "no". Changing this entry has no effect at the moment </li>

## Update the notebook
When you want to update your notebook (and I recommend doing it often, and now you will understand why), just go to the project folder where the <code>.labnotebook/</code> folder is located and type the command <code>updatenotebook</code>.
At this point you will be asked for confirmation to update the notebook and the notebook update will start: if the SHOW_ANALYSIS_FILES option is equal to "no", nothing will happen and the notebook will be updated, otherwise for each commit you will be asked which of the modified files is the analysis file (among the various options there is also <i>none</i>, to be selected if no analyzes have been carried out or you do not want to insert any file).

The file being updated is .labnotebook/body.html.

## Export the notebook in html format
When you decide you want to export the notebook, just be in the folder containing <code>.labnotebook/</code> and type <code>exportnotebook \<filename.html\></code>.
You will be asked if the css file indicated in the config file should be copied in the head of the html file (if you want to share only the html file) or if it should be linked to in the head (if you want to share both the html file and the css file).

At this point, the notebook is ready to be viewed with a browser, read, browsed and analyzed.
</div>