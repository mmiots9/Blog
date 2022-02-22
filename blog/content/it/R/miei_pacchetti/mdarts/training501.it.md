---
title: "Funzione per un leg di allenamento a 501"
h1title: "Training501: la funzione per un leg di allenamento"
date: 2022-02-22
modified: 
description: "Descrizione ed uso della funzione per fare dei leg di allenamento"
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: true
tocPosition: outer
tocLevels: [h2", "h3", "h4"]
tags:
- R
- Darts
- Pacchetti
- Allenamento
series:
- mdarts
categories:
- I miei pacchetti
image: "/images/R/miei_codici/mdarts/training501.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

<div style="text-align: justify;">

Oggi vediamo la funzione *training501*, che ci permette di effettuare dei leg di allenamento al classico gioco delle freccette 501.

## Lancio e input
<p style="margin-bottom:0px;"> Partiamo dal lancio della funzione e dagli input necessari. La funzione verrà lanciata col comando <code>training501(input)</code> e avrà i seguenti input: </p>
<li><i>player</i>: nome giocatore</li>
<li><i>save</i>: se salvare o meno il leg di allenamento in un file. Di default è T</li>
<li><i>file</i>: (opzionale). Nome del file nel quale salvare l'allenamento. Di default è NA, se save = T e file = NA, un prompt chiederà di selezionare il file di destinazione</li>

<div class="notices warning" data-title="Importante" style="margin:0px;">
Per usi successivi, è fortemente consigliato lanciare il comando salvando il risultato in una variabile: <br><code>var <- training501(input)</code>
</div>

## Istruzioni e inserimento valori
La modalità di inserimento dei valori è la stessa usata per la funzione <a href="https://miotsdata.netlify.app/it/r/miei_pacchetti/mdarts/match/#istruzioni-e-inserimento-valori" target='_blank'>match_501</a>. 

<p style="margin-bottom:0px;"> Una volta inseriti i valori, la funzione eseguirà le seguenti operazioni:<p>
<ol>
<li>Controlla che i valori inseriti siano validi (giusta forma e numeri esistenti). In caso contrario, uscirà un messaggio di errore e verrà richiesto al giocatore di inserire nuovamente i valori delle tre freccette</li>
<li>Controlla che non sia abbia sballato</li>
<li>Sottrae il valore a quello dello score del giocatore e si passa al turno successivo</li>
<li>(In fase di chiusura) Controlla che lo 0 si sia raggiunto con una doppia</li>
</ol>

## Fine allenamento
Una volta terminato l'allenamento, un ogggetto di classe *legtr* verrà ritornato. Se l'oggetto è stato salvato in una variabile, verrà solo mostrato un messaggio di fine allenamento, in caso contrario verrà mostrato un messaggio che presenta la data, il nome del giocatore e il numero di freccette utilizzate per chiudere.


## Salvataggio in un file
<p style="margin-bottom:0px;"> Se si dovesse decidere di salvare l'allenamento in un file, la funzione aggiungerà 2 righe di testo a quel file. Nel dettaglio:</p>
<li>Prima riga: id del leg, nome del giocatore</li>
<li>Seconda riga: freccette tirate, in forma 18,t19,d20,...</li>

## Ottenere informazioni sul leg di allenamento
Per ottenere informazioni sul leg, si possono usare alcune delle funzioni get descritte in questo <a href="https://miotsdata.netlify.app/it/r/miei_pacchetti/mdarts/getoptions/#funzioni-utili" target='_blank'>post</a> (getPlayers, getID, getDate). 

</div>