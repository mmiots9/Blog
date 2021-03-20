---
title: "Death FROM Covid or WITH Covid?"
date: 2021-03-20
modified: 
description: 'Esempio di come una attenta analisi dei dati può aiutarci a comprendere meglio la questione "di Covid o con covid?'
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: false
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- Covid
- Mortalità
- Fake news
series:
- Covid
categories:
- Pillole analisi dati
image: "/images/R/Teoria/r_symbol.jpeg"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

Come si può intuire dal titolo, l'obiettivo sarà cercare di rispondere alla famosa domanda che da un anno ci perseguta tramite un'analisi dei dati: sono morti DI Covid o CON Covid?. Per rispondere a questa domanda dobbiamo prima fare uno step indietro.

### "Era una banale influenza"
Ebbene sì. Molti sostengono fosse una banale influenza e che quindi l'impatto che ha avuto sul nostro paese sia irrisorio. A questo proposito, ci viene in aiuto con questo utilissimo. [file](https://www.istat.it/it/files//2020/03/Dataset-decessi-comunali-giornalieri-e-tracciato-record_5marzo.zip) nel quale sono riportati i dati relativi alle morti dal 2011 al 2020 in Italia. 
Il modo migliore per confrontare il 2020 con gli altri anni è quello di tenerlo da parte e andare a vedere le caratteristiche della distribuzione del numero di morti negli altri anni. 
Tramite lo Shapiro-test per la normalita vediamo che la distribuzione è normale (W = 0.90009, p-value = 0.2525); dunque, ne calcoliamo media e deviazione standard (631,235.8 e 19,944.2 rispettivamente) e useremo questi valori per descrivere la distribuzione. 
Nel 2020 sono stati registrati, purtroppo, 746,146 decessi; confrontando questo dato con la media dei 9 anni precedenti (631,235.8) si vede un **aumento del 15.57%** del numero di decessi. Paragonandolo al peggiore di quei 9 anni (il 2017, tanto caro a chi fa conforonti su fb), l'aumento è del 13.14%!
Se questa differenza non fosse chiara a numeri, ecco di seguito un grafico in cui è disegnata la distribuzione normale costruita secondo i parametri di cui sopra (media e sd).
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/distr_2011_201920.png" width="700"/>
In rosso è evidenziato quanto il numero di morti del 2020 si distacchi dalla distribuzione normale. Impressionante no?
Tornando un attimino ai numeri, il dato del 2020 si trova oltre le 5.5 deviazioni standard rispetto alla media del periodo 2011-2019, questo lo pone al 100-esimo percentile della distribuzione, con una probabilità di ottenere un valore ancora più a destra rispetto al 2020 pari a 4.166336e-09 (in percentuale uguale a 0.0000004166%). 
Per farvi capire quanto sia piccolo questo numero: è come se la distribuzione di probabilità quei valori fosse lunga 10 km e il valore del 2020 si trovasse a 4 mm (millimetri!) dalla fine.

Bene, questo dovrebbe far capire che l'impatto che questa "banale influenza" ha avuto sul nostro paese non è per nulla irrisorio.

### "Se avevi un infarto ti mettevano dentro i morti Covid per gonfiare i numeri"
Ed eccoci arrivati al secondo mantra per coloro che sostengono che sia tutta una grande invenzione.
Poniamo per assurdo che questo ragionamento sia vero, e che quindi i numeri dei morti a causa del Covid siano stati gonfiati. Seguendo questo ragionamento, il numero di decessi dichiarati Covid dovrebbe essere SUPERIORE alla differenza che c'è tra il numero di morti nel 2020 e la media 2011-2019. Analizzando questi dati si scopre che i decessi dichiarati Covid sono stati 75,891 ([fonte](https://www.istat.it/it/files//2020/03/tabella-decessi-provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo.xlsx)), mentre la differenza tra i morti 2020 e la media degli anni precedenti è di circa 114,910 unità. In pratica, escludendo le morti dichiarate Covid, sembrano esserci 39,019 morti in più rispetto alla media 2011-2019 e 10,782 rispetto al famoso 2017.
Siamo in una situazione esattamente opposta rispetto a quella dell'ipotesi iniziale: non sono stati gonfiati i morti di Covid, semmai è più probabile siano stati sottostimati, o che la pressione ospedaliera provocata dalla pandemia abbia diminuito la capacità di servizio del sistema sanitario, causando così un aumento della mortaità generale. 
Quindi, non solo il Covid ha causato **direttamente** la morte di circa 75 mila persone, ma ha anche **indirettamente** provocato la morte di circa 10 mila persone (considerando il 2017) o di circa 40 mila (confrontando la media degli anni precedenti).
Qualcuno potrebbe obiettare dicendo che è stato un anno particolarmente "nesfato" in generale, non a causa del Covid. 
Per smentire questa possibilità, analizziamo i seguenti grafici:
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/andamento_mesi.png" width="700" height="500"/> 
In alto abbiamo il grafico relativo all'andamento del numero totale dei morti per ogni mese. Si vede come il 2020 si differenzi rispetto al quinquennio 2015-2019 grazie a due picchi: il primo in corrispondenza di marzo/aprile, il secondo a novembre. Nei mesi da maggio a settembre invece le due linee sono praticamente sovrapponbili, evidenziando come il 2020 sia esattamente in linea rispetto al quinquennio precedente in quel periodo.
Questa dovrebbe già essere una prova del fatto che il 2020 non è stato un anno "nefasto" in generale. 
La controprova è data dalla linea blu di quel grafico e dal grafico di sotto; infatti, la linea blu rappresentante i decessi "Covid" ha i picchi esattamente in corrispondenza dei picchi dei morti totali del 2020. Inoltre, considerando il grafico di sotto, dove sono stati sottratti i morti "Covid" a quelli totali (linea verde sopra - linea blu), vediamo che l'andamento del 2020 è quasi del tutto simile a quello della media del quinquennio precedente, con ancora picchi a marzo (13 mila morti in più) e a novembre.
Questa è la prova definitiva che i morti Covid sono morti DI Covid e non CON Covid, altrimenti come si spiegherebbe un aumento così importante della mortalità totale in corrispondenza dei picchi di mortalità Covid?












