---
title: "Diario del terminale"
h1title: "Funzioni diary: creare un diario delle funzioni del terminale"
date: 2021-10-06
modified: 
description: "Salvare porzioni di history in un file separato"
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: true
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- Bash
- Diario
- Terminale
- Zsh
series:
- Le mie funzioni bash
categories:
- Bash
image: "/images/Bash/diary/diary.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Oggi vi parlo di come creare un "diario" dei comandi lanciati sul terminale. Sappiamo tutti che col comando `history` possiamo vedere i comandi lanciati di recente, e che esiste anche un file (.bash_history o .zsh_history, in base a quale shell si utilizza); **ma**, spesso si vuole avere solo una porzione della history.  
Più precisamente, si vuole creare quello che in altri linguaggi e su altre piattaforme si chiama *diary*, ovvero specificare "ok, da qui in poi registra i comandi che scrivo e salvameli in un altro file". Spesso si usa per avere traccia di un lavoro, di una analisi, oppure per conservare il lavoro fatto in un giorno ecc.  
Questo, al momento, non si può fare col terminale. Per questo motivo ho deciso di creare una coppia di funzioni che ci permette di fare questo: *diarystart* e *diaryend*.  
Vediamo come funzionano.

## Diarystart
Questa funzione va lanciata quando si vuole iniziare a registrare i comandi successivi.  
La sua forma è molto semplice: `diarystart filename`. Il *filename* è il nome del file nel quale verranno salvati i comandi (può anche contenere un path) e deve essere sempre specificato.  
In questo momento il file <u>non</u> viene ancora creato.

<p style="margin-bottom:0;">Ci sono 2 cose da tenere in considerazione:</p>
<li> <b>non</b> usare <u>mai</u> un filename già esistente sulla macchina, in quanto il comando successivo lo sovrascriverebbe</li>
<li> <b>non</b> creare <u>mai</u> un alias di questa funzione, in quanto quella successiva va alla ricerca del comando <i>diarystart</i> nella history. Se proprio si vuole creare un alias, modificare la funzione diaryend di conseguenza</li>
  
A questo punto, si è liberi di eseguire i comandi di interesse e lavorare sul terminale.

## Diaryend
Una volta che si è finito di lavorare e si vuole salvare la history dei comandi successivi a diarystart, si lancia il comando `diaryend` da solo. Questa funzione creerà un file (quello specificato in diarystart) nella quale ci sarà l'elenco dei comandi utilizzati.  
Una peculiarità di questa coppia di funzioni è che se ci si dimentica di lanciare diaryend alla fine della giornata, lo si può lanciare tranquillamente all'inizio del giorno successivo.

## Esempio
Di seguito un piccolo esempio del funzionamento di queste funzioni:

<div style="text-align:center">
<video height=300px width=auto controls>
  <source src="/images/Bash/diary/diary.mov">
</video>
</div>





</div>