---
title: "R environment commands"
date: 2021-03-14
modified: 
description: "List of useful commands to manage R environment"
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: false
tocPosition: inner
tocLevels: ["h2", "h3", "h4"]
tags:
- R
- Environment
series:
- R basic
categories:
- R theory
image: "/images/R/Teoria/r_symbol.jpeg"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">
## Directory
Let's see basic commands that help us to manage the working directory.

### Which is the current working directory?
Firstly, to evaluate which is the current working directory (the one in which files are saved and the one that R reads) we use:
``` R
getwd()
```
DO NOT type anything in the brackets.
It returns a string representing the path of the working directory. It could be useful to store it in a variable in order to easily use it in other functions.

### How to change the working directory?
To change the current working directory, type:
``` R
setwd("path")
```
Replace *path* with the desired one. To confirm that the wd is changed, use `getwd()`.

## Packages
Now, we're going to see how to handle packages

### Installed packages
There is a useful command to retrieve the list of installed packages; unfortunately it returns a character vector that is difficult to read. For this reason, int the following code there is an extra part that allows us to obtain only the name of the packages, their versions and their depends.
``` R
installed.packages()[,c(3,5)]
```
To quickly evaluate if a package is present, we can use:
``` R
"package" %in% installed.packages()[,1]
```

### Install new package
If the required package is not in that list or if we know that it should be installed, we use:
``` R
install.packages("packages")
```
To **uninstall** a package: `uninstall.pachages("packages")`.
*Packages* inside brackets could be a single package or a vector of more packages.

### Loaded packages
To retrieve which packages are active we use this command:
``` R
(.packages())
```
It returns a character vector with all the active packages.
To quickly evaluate if a package is loaded, we can use:
``` R
"package" %in% (.packages())
```

### Load a package
If our package is not loaded and we want to load it, we have to type:
``` R
library(pachages)
```
To **unload** a package:`detach(package:pacchetto, unload = TRUE)`

## Environment
Let's see how to handle environment variables.

### Variable list
To retrieve which variables are stored:
``` R
ls()
```
It returns a vactor with the names of the stored variables.

### Remove variables
This is the function that removes variables:
``` R
rm(variable)
```
*Variable*  could be both the name of a variable or a list of variable (NOT a vector). So, in order to remove more variables we should use `rm(list = c(variables))`, and to **remove all variables** `rm(list = ls())`.

## History
History is a fundamental element when we're working on projects. For this reason, there are a couple of functions that we must know.

### Save the history
Saving the history is useful when we are testing some codes, some functions or doing an analysis. To do it:
``` R
savehistory("filename.Rhistory")
```
This file is stored in the current working directory, to change directory we shoul insert the path in the filename.

### load the history
To load the history from a saved file:
``` R
loadhistory("filename.Rhistory")
```

{{< expand "Expand me" >}}

### Title

contents

{{< /expand >}}
</div>


