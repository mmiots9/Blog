---
title: "Comandi base environment R"
date: 2021-03-14
modified: 
description: "Elenco di comandi basilari per gestire l'environment di R"
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
- R base
categories:
- R teoria
image: "/images/R/Teoria/r_symbol.jpeg"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

## Directory
Vediamo ora i comandi base per gestire la directory di lavoro.

### In che directory sono?
Per prima cosa vediamo come controllare quale sia la directory di lavoro, ovvero quella che R legge (andando a prendere file e salvandoli su):
``` R
getwd()
```
Basta questo comando, non bisogna inserire NIENTE dentro le parentesi. 
Quello che ritorna è una stringa contentente il path della directory di lavoro. È quindi utile di solito salvarselo in una variabile da inserire in funzioni che si usano più avanti magari. 

### Come cambio la directory di lavoro?
Per cambiare la directory di lavoro si usa il seguente comando:
``` R
setwd("path")
```
Rimpiazzare *path* con quello desiderato. Per confermare il cambio usare `getwd()`.

## Pacchetti
Passiamo ora a vedere i comandi base per gestire quello che concerne i pacchetti.

### Lista pacchetti installati
C'è un utilissimo comando per vedere la lista di tutti i pacchetti installati. Questo comando però ritorna un vettore caratteri difficile da leggere, per questo motivo presento un codice che seleziona solo il nome del pacchetto, la versione e le condizioni affinchè funzionino.
``` R
installed.packages()[,c(3,5)]
```

### Installare un nuovo pacchetto
Se il pacchetto richiesto non è nella lista o se si sa già che bisogna installarlo *de novo*, si usa questo comando:
``` R
install.packages("pacchetti")
```
Per **disinstallare** un pacchetto: `uninstall.pachages("pacchetti")`.
*Pacchetti* può essere un solo pacchetto o anche un vettore caratteri di puù pacchetti.

### Lista pacchetti caricati
Per vedere quali pacchetti sono attualmente attivi si usa questo comando:
``` R
(.packages())
```
Ritorna un vettore caratteri con l'elenco dei pacchetti attivi

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



