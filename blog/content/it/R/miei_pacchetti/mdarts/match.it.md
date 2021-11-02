---
title: "Funzione per un match 501"
h1title: "Match_501: la funzione per una classica partita a freccette"
subtitle: "Come giocare la tua prima partita a freccette"
date: 2021-11-03
modified: 
description: "Spiegazione di come usare la funzione per fare una partita"
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
- Partita
series:
- mdarts
categories:
- I miei pacchetti
image: "/images/R/miei_codici/mdarts/match/match.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

<div style="text-align: justify;">

Eccoci arrivati al primo post di spiegazione di questo pacchetto per il gioco delle freccette. Oggi vedremo come usare la funzione `match_501` per fare una classica partita a freccette e vedere i risultati.

## Lancio e input
<p style="margin-bottom:0px;"> Partiamo ovviamente dal lancio della funzione e dagli input necessari. La funzione verrà lanciata col comando <code>match_501(input)</code> e avrà i seguenti input: </p>
<li><i>player 1</i>: nome del primo giocatore, quello che <u>inizia</u> il primo leg</li>
<li><i>player 2</i>: nome del secondo giocatore</li>
<li><i>sets2win</i>: numero di set necessari per vincere la partita, di default è 1</li>
<li><i>legs2win</i>: numero di leg necessari per vincere un set, di default è 1</li>

Per esempio, lanciando il comando `match_501(player1 = "John", player2 = "Julie", sets2win = 2, legs2win = 3)` verrà creata la partita tra John e Julie in cui è necessario vincere 3 leg per vincere un set, e 2 set per vincere il match.

<div class="notices warning" data-title="Importante" style="margin:0px;">
Per usi successivi, è fortemente consigliato lanciare il comando salvando il risultato in una variabile: <code>var <- match_501(input)</code>
</div>

## Istruzioni e inserimento valori
Una volta lanciata la funzione, come prima cosa appariranno le istruzioni su come inserire i valori delle freccette tirate:

<figure id="instruction">
  <img src="/images/R/miei_codici/mdarts/match/instruction.png" alt="Istruzioni" width=90%>
  <figcaption style="text-align:center;">Figura 1: Istruzioni su come inserire i valori delle freccette</figcaption>
</figure>

A questo punto, premendo invio apparirà la tabella dei punteggi e verrà richiesto al primo giocatore di inserire i punteggi delle freccette (nome indicato nella schermata):

<figure id="punteggio1">
  <img src="/images/R/miei_codici/mdarts/match/punteggio1.png" alt="Schema iniziale del punteggio" width=90%>
  <figcaption style="text-align:center;">Figura 2: Schema iniziale dei punteggi</figcaption>
</figure>

<p style="margin-bottom:0px;"> Una volta inseriti i valori, la funzione eseguirà le seguenti operazioni:<p>
<ol>
<li>Controlla che i valori inseriti siano validi (giusta forma e numeri esistenti). In caso contrario, uscirà un messaggio di errore e verrà richiesto al giocatore di inserire nuovamente i valori delle tre freccette</li>
<li>Controlla che non sia abbia sballato</li>
<li>Sottrae il valore a quello dello score del giocatore e si passa al giocatore successivo, aggiornando i valori della tabella dei punteggi</li>
<li>(In fase di chiusura) Controlla che lo 0 si sia raggiunto con una doppia</li>
<li>(Se il leg è chiuso) Passa al leg/set successivo</li>
</ol>

## Fine match
Una volta terminato il match, verrà fornito un recap di esso con indicato la data della partita, i giocatori che ne hanno preso parte e il vincitore (col punteggio):
<figure id="fine">
  <img src="/images/R/miei_codici/mdarts/match/fine.png" alt="Fine della partita" width=90%>
  <figcaption style="text-align:center;">Figura 3: Fine della partita e recap</figcaption>
</figure>
Nella figura si può apprezzare come il punteggio sia aggiornato di mano in mano, alla fine di ogni leg e set viene indicato il vincitore e alla fine della partita ci sia il recap. In questo caso, a puro titolo dimostrativo, la partita si vinceva con un solo leg per set e un solo set.


## Classe match, set e leg
Dopo aver visto i semplici passaggi necessari per effettuare una partita, vi lascio introducendovi le classi che ho creato per salvare i dati di una partita. Queste classi sono *leg1p*, *set1p*, *match1p* e *match2p*, e sono tutte di tipo S4.  
Per aiutare a capire meglio la struttura, ecco uno schema rappresentativo della loro forma e degli slot presenti in ognuna:

<figure id="scheme">
  <img src="/images/R/miei_codici/mdarts/match/scheme.png" alt="Schema delle classi" width=90%>
  <figcaption style="text-align:center;">Figura 4: Schema della struttura e delle relazioni tra le classi</figcaption>
</figure>

La struttura è ad intreccio: l'oggetto finale che viene fornito dalla funzione è di classe **match2p**. Essa contiene il numero di set necessari per vincere la partita e un oggetto di classe **match1p** per ogni giocatore. Esso contiene un indicatore di vittoria (1 nel caso affermativo, 0 in caso di sconfitta) e una lista di oggetti **set1p**, uno per ogni set. La struttura di quest'ultimo oggetto ricalca quella di match1p: indicatore vittoria e lista di oggetti **leg1p**, uno per ogni leg.   
In questa classe sono contenute molte più informazioni rispetto alle altre: l'ID del leg, il nome del giocatore, un valore numerico che indica se ha incominciato lui (1) o meno (0) quel leg, l'indicatore della vittoria e un vettore di caratteri contenente gli score delle freccette tirate.  
Per chi non conoscesse le modalità di accesso agli slot degli oggetti S4, ho creato anche delle funzioni per ricavare queste, ed altre, informazioni. Ma questo sarà oggetto di un post futuro, nel quale parlerò anche del salvataggio e del caricamento di questi dati.
Stay tuned!

</div>