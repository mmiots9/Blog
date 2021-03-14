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
- environment
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

### Caricare un pacchetto
Se il pacchetto che vogliamo utilizzare non è nei pacchetti attivi, o se sappiamo già non esserci, usiamo questo comando:
``` R
library(pacchetti)
```
Per disattivare un pacchetto: `detach(package:pacchetto, unload = TRUE)`.

## Environment
Vediamo ora come gestire le variabili nell'environment.

### Lista variabili
Per vedere quali variabili sono salvate nell'environment usiamo:
``` R
ls()
```
Ritorna un vettore coi nomi di tutte le variabili salvate.

### Rimuovere una variabile
Per rimuovere una variabile si usa la funzione:
``` R
rm(variabile)
```
*Variabile* può essere il nome di una variabile o una lista di variabili (NON vettore). Va da sè che per eliminare più variabili si usa `rm(list = c(variabili))` e per **eliminare tutte le variabili** `rm(list = ls())`.

## History
La history rappresenta un elemento molto importante quando si lavora su alcuni progetti, per questo ci sono varie funzioni che ci permettono di sfruttarne le potenzialità.

### Salvare la history
È sempre utile salvare la history quando si stanno facendo varie prove per una funzione o per una analisi. Per farlo si usa:
``` R
savehistory("filename.Rhistory")
```
Il file viene salvato nella directory di lavoro, per cambiare posto inserire il path nel filename.

### Caricare la history
Se si vuole caricare la history precedentemente salvata in un file:
``` R
loadhistory("filename.Rhistory")
```
</div>


