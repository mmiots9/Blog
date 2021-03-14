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
image:
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

## Directory

Vediamo ora i comandi base per gestire la directory di lavoro.

Per prima cosa vediamo come controllare quale sia la cartella di lavoro, ovvero quella che R legge (andando a prendere file e salvandoli su):

``` r
getwd()
```
Basta questo comando, non bisogna inserire NIENTE dentro le parentesi. 
Quello che ritorna è una stringa contentente il path della cartella di lavoro. È quindi utile di solito salvarselo in una variabile da inserire in funzioni che si usano più avanti magari. 