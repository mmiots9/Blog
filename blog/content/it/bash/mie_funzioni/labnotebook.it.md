---
title: "Creare lab notebook per bioinformatici"
h1title: "Creare lab notebook per bioinformatici"
subtitle: "Come creare un lab notebook lavorando come bioinformatico"
date: 2022-03-16
description: "Come creare un lab notebook lavorando come bioinformatico"
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
- Lab notebook
- Bioinformatico
- Diario
series:
- Le mie funzioni bash
categories:
- Bash
image: "/images/Bash/Labnotebook.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Oggi vi parlo del progetto <i>labnotebook</i>, nato dalla necessità di compilare un laboratory notebook in maniera automatica, veloce e sistematica.  
Per chi non lo sapesse, nei laboratori di ricerca è obbligatorio tenere traccia di tutto ciò che si fa tramite dei quaderni chiamati appunto "laboratory notebook"; la natura del lavoro di un bioinformatico però è molto diversa rispetto a quella di chi sta al bancone, di conseguenza anche le possibilità di tenere traccia di ciò che si è fatto lo è.  
Molti conosceranno git o altri sistemi di controllo delle versioni, ovvero sistemi che permettono di avere una traccia di tutte le modifiche apportate ad un file, avendo uno storico. Per accedere a questo storico bisogna avere padronanza di questi sistemi, il che rende difficile (se non impossibile) la lettura di questi storici a chi non li usa.  
Per questo motivo, ho deciso di creare un pacchetto di funzioni che permettono di trasformare questo storico in un file html, personabilizzabile, facile da esportare e condividere. Trovare questo pacchetto di funzioni in questa <a href="https://github.com/mmiots9/labnotebook" target="_blank">repo</a> su github.

<div class="notices warning" data-title="Importante" style="margin:0px;">
<p>Per usufruire di queste funzioni è necessario che si abbia git installato, che il progetto su cui si lavori sia sotto il controllo di git e che i commit siano compilati in maniera esaustiva.</p>
</div>

## Struttura del notebook
Il notebook è così strutturato:  
Come intestazione c'è il nome del notebook, seguito dalla data di creazione e dall'autore (preso dal config file di git),  
Successivamente, per ogni data abbiamo l'elenco dei commit (quindi delle azioni svolte) con specificato il cosa si è fatto, lo sha del commit, eventualmente il file contenente l'elenco dei comandi eseguiti/analisi fatte, e l'elenco dei file modificati, con indicato se sono stati aggiunti (A), modificati (M), cancellati (D) o rinominati (R).  

Un esempio lo potete trovare <a href="../example.html" target="_blank">qui</a>.

## Creare un notebook
Per creare un notebook basterà essere nella cartella del progetto dove è situata la cartella <code>.git/</code> e lanciare il comando <code>createnotebook \<nome_notebook\></code>.  
Verrà chiesto se la cartella .labnotebook che verrà creata dovrà essere ignorata da git (quindi se va inserita dentro il file .gitignore); da quel momento la cartella .labnotebook sarà presente dove è situata quella .git.  
<p style="margin-bottom: 0px;">All'interno della cartella troviamo vari file:</p>
<li>config: file di configurazione, ne parliamo più nel dettaglio fra poco</li>
<li>labstyle.css: file css base che controlla lo stile del file html che si crea quando si esporta il notebook. Anche di questo ne parliamo fra poco</li>
<li>head.html: file contenente una parte della head del file html</li>
<li>body.html: file che contiene il body del file html, verrà costantemente aggiornato</li>
<li>footer.html: file che contiene l'ultima parte del file html</li>

## Il file config
Il file config contiene alcune impostazioni iniziali che si possono modificare all'occorrenza, stando attenti però a non compromettere la funzionalità delle funzioni di aggiornamento del notebook e di export del notebook.  
<p style="margin-bottom: 0px;">Vediamo le voci contenute:</p>
<li>NOTEBOOK_NAME: nome del notebook</li>
<li>LAST_COMMIT: contiene lo sha dell'ultimo commit inserito nel notebook. Appena creato il notebook il valore è "no". Si consiglia di modificare questa voce <b>solo</b> se strettamente necessario (per esempio se l'ultimo commit non è più nella history)</li>
<li>LAB_AUTHOR: nome dell'autore del notebook</li>
<li>LAST_DAY: la data dell'ultimo commit presente nel notebook</li>
<li>SHOW_ANALYSIS_FILES: di default è "yes" e indica il fatto di aggiungere una voce su quale sia il file dei comandi/delle analisi per ogni commit da inserire nel notebook. Si può modificare inserendo "no", a quel punto non sarà aggiunta quella voce</li>
<li>LAB_CSS: path del file css che comanda lo stile del notebook. È possibile modificarlo se si vuole utilizzare un diverso stile usando un proprio file css</li>
<li>LAB_IGNORE: indica se la cartella .labnotebook è inserita in .gitignore "yes" o meno "no". Cambiare questa voce non ha alcun effetto al momento</li>

## Aggiornare il notebook
Quando si vuole aggiornare il notebook (e consiglio di farlo spesso, e ora capirete il perchè), basta andare nella cartella del progetto dove è situata la cartella <code>.labnotebook/</code> e digitare il comando <code>updatenotebook</code>.  
A questo punto verrà chiesta la conferma per aggiornare il notebook e partirà l'aggiornamento del notebook: se l'opzione SHOW_ANALYSIS_FILES sarà uguale a "no", nulla accadraà e il notebook verrà aggiornato, altrimenti per ogni commit verrà richiesto quale dei file modificati sia il file di analisi (tra le varie opzioni c'è anche <i>none</i>, da selezionare se non sono state fatte analisi o non si vuole inserire alcun file).  

Il file che viene aggiornato è .labnotebook/body.html. 

## Esportare il notebook in formato html
Nel momento in cui si decide di voler esportare il notebook, basterà essere sempre nella cartella contenente <code>.labnotebook/</code> e digitare <code>exportnotebook \<nome_file.html\></code>.  
Verrà richiesto se il file css indicato nel file config vada copiato nella head del file html (se si vuole condividere solo il file html) o se vada linkato nella head (se si vuole condividere sia il file html sia il file css).

A questo punto, il notebook è pronto per essere aperto con un browser, letto, sfogliato e analizzato.
</div>