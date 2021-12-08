---
title: "Gestire le repository git e github"
h1title: "Repoinfo e topush: funzioni per la gestione delle repo locali e di github"
subtitle: "Come scoprire quale è l'ultimo commit remoto e se ci sono commit da pushare"
date: 2021-12-08
description: "Come scoprire quale è l'ultimo commit remoto e se ci sono commit da pushare"
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
- Terminale
- Zsh
- Github
- Repository
series:
- Le mie funzioni bash
categories:
- Bash
image: "/images/Bash/gitInfo/cover.it.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Questo post è dedicato a chi, come me, ha un po' di repository su github e o collabora con un team, oppure ha più pc sui quali vuole passarsi le ultime novità.
Vi parlo di due funzioni che ho sviluppato che si sono rese necessrie (se non fondamentali) per tenere in ordine le repo locali.  
Queste funzioni si chiamano *repoinfo* e *topush*, e si trovano nel file *git-info.sh* della repo su <a href="https://github.com/mmiots9/bash-functions" target="_blank">github</a>. Vediamole assieme!

## Repoinfo
Partiamo da *repoinfo*. Questa funzione è nata proprio perchè volevo sapere se l'ultimo commit pushato fosse stato fatto da un pc o da un'altro, in modo tale da sapere se dovessi pullare <u>prima</u> di mettermi a lavorare o meno.  
Ma cosa fa? Il concetto è semplice: tramite l'API di github printa sullo schermo una riga per ogni repo di github, anche quelle **private**, contenente le seguenti informazioni sull'<u>ultimo</u> commit:<br> <span style="color:red">Nome repo</span>: pushed by <span style="color:green">autore commit</span> on <span style="color:#D788FC">data commit</span> at <span style="color:#D788FC">ora</span>: commit message.

Una volta scaricato il file, bisognerà prima settare 2 impostazioni:

<figure id="settaggi_iniziali">
  <img src="/images/Bash/gitInfo/repoinfoset.png" alt="Prime cose da settare repoinfo" width=90%>
  <figcaption style="text-align:center;">Figura 1: settaggi iniziali per la funzione repoinfo</figcaption>
</figure>
La prima è il proprio token di github (se non sapete cosa sia o dove trovarlo, <a href="https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token" target="_blank">qui</a> c'è la spiegazione), la seconda è il proprio username su github. Queste informazioni sono <b>fondamentali</b> per accedere all'API.

Una volta settati questi parametri, basterà lanciare il comando *repoinfo* sul terminale e il gioco è fatto. Ricordo di guardare il README.md file della mia repo per le istruzioni sulla corretta "installazione" delle funzioni.

## Topush
Passiamo ora a *topush*. Questa funzione è nata con l'idea di vedere se ci fossero file untracked o commit da pushare tra le varie repo locali. In pratica, la funzione cerca tutte le repo git locali, e per ognuna vede se ci sono file non tracciati, non aggiunti al commit o commit da pushare.  
Quello che viene printato a schermo è il risultato del comando <code>git status -bs --ahead-behind</code> per ogni repo, accompagnato dal nome della repo.

Ecco qui un esempio:
<figure id="output_topush">
  <img src="/images/Bash/gitInfo/topush.png" alt="Output della funzione topush" width=80%>
  <figcaption style="text-align:center;">Figura 2: Esempio di output della funzione topush</figcaption>
</figure>
In immagine ho applicato un effetto blur sui dati "sensibili". Sotto il numero c'è il nome della repo, seguita dal nome della branch locale e di quella remota (riga sotto visibile). Poi vediamo come nella repo numero 1 ci sia un file modificato ma non aggiunto ad una commit; mentre la repo 2 è a posto e la 3 invece presenta file mai tracciati. 
<br><br>

**Importante**: Per come funziona questa funzione, può essere che esca un file "temp-pull.txt" (che se notate bene è l'ultimo file in figura) come non tracciato. Non dovete preoccuparvi, esso è un file temporaneo che in realtà viene cancellato alla fine della funzione.

<br>
In questo caso c'èun solo settaggio da fare, ovvero quello di aggiungere eventuali nomi di cartelle da non tracciare nella funzione (si trova tutto scritto nello script). Questo per evitare che escano tutte le repository non vostre, ma che avete perchè utili per voi (per esempio plugin di vim o altre).


## Miglioramenti futuri
Come ogni funzione che si rispetti, ci sono sicuramente delle migliorie apportabili. In questo caso riguardano le branch. Infatti, entrambe le funzioni tracciano solo le branch attive in quel momento.  
Per quanto riguarda la funzione *repoinfo*, sarà più facile fare in modo di avere una lista di ogni repo ed ogni branch, mentre per la funzione *topush* questo è complicato, dal momento che non si può fare il checkout dalla branch attiva se ci sono file aggiunti ma non commit, o file neanche aggiunti o mai tracciati. <br>Sarà una bella "sfida". Quindi, come al solito: stay tuned!



</div>