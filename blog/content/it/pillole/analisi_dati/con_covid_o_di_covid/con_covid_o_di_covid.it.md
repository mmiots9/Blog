---
title: "Morti PER Covid o CON Covid?"
date: 2021-03-24
modified: 
description: 'Esempio di come una attenta analisi dei dati può aiutarci a comprendere meglio la questione "per Covid o con covid?"'
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
image: "/images/Pillole/Analisi_dati/di_covid_o_con_covid/coronavirus.jpg"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

Come si può intuire dal titolo, l’obiettivo di questo post sarà cercare di rispondere, tramite un’analisi dati, alla famosa domanda che da un anno ci perseguita: la gente è morta PER Covid o CON Covid? Per rispondere a questa domanda, dobbiamo prima fare uno step indietro.

### “È una banale influenza”
Ebbene sì. Molti sostengono sia una banale influenza e che l’impatto che ha avuto sul nostro paese sia irrisorio. A questo proposito, ci viene in aiuto questo utilissimo [file](https://www.istat.it/it/files//2020/03/Dataset-decessi-comunali-giornalieri-e-tracciato-record_5marzo.zip) nel quale sono riportati i dati relativi alle morti dal 2011 al 2020 in Italia.
Per poter confrontare al meglio i dati, conviene analizzare in primo luogo quelli relativi alla mortalità compresa tra il 2011 e il 2019, anni in cui la situazione era “normale”.
Grazie allo Shapiro-test, possiamo vedere che i dati si distribuiscono secondo una distribuzione normale (W = 0.90009, p-value = 0.2525). La media e la deviazione standard, utili per descrivere tale distribuzione, risultano rispettivamente pari a 631,235.8 e 19,944.2.
Passiamo ora al 2020: sono stati registrati, purtroppo, 746,146 decessi; confrontando questo dato con la media dei 9 anni precedenti (631,235.8) si vede un **aumento del 15.57%** del numero di morti. Paragonando questi numeri al peggiore di quei 9 anni, il 2017 – come tanto ama fare chi gioca con i numeri su Facebook – l’aumento è del 13.14%.

Per rendere ancora più intuibili questi dati, ecco di seguito un grafico in cui è rappresentata la distribuzione normale costruita secondo i parametri di cui sopra (media e deviazione standard).
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/normale_it.png" width="850"/>


La linea rossa mostra dove si colloca il 2020 in quanto a mortalità totale rispetto ai 9 anni precedenti, sottolineando quanto si distacchi dalla distribuzione normale.
Impressionante, no?
Tornando un attimo ai numeri, il dato del 2020 si trova oltre le 5.5 deviazioni standard rispetto alla media del periodo 2011-2019, ponendolo al 100-esimo percentile della distribuzione.
Chiariamo quest’ultimo passaggio: usando i dati del periodo 2011-2019 si è costruita una distribuzione definita "normale" (con la classica forma a campana),  che evidenzia la relazione tra il numero di morti (asse x) e la probabilità associata (asse y, non rappresentato in figura). Questo ci permette di ricavare sia la probabilità associata ad un numero preciso di morti, sia quella di ottenerne uno maggiore o minore (in una situazione senza "interferenze" esterne, quali guerre, pandemie…) e di fare predizioni sul futuro. Per esempio, immaginiamo di tornare a fine 2019 (senza Covid) e di voler sapere quale sarà la probabilità che nel 2020 ci sia un numero di morti superiore a 630,000; grazie a questa distribuzione sappiamo che la probabilità è pari al 53%.
Tornando alla realtà, la probabilità di ottenere in una situazione "normale" un numero di morti maggiore di quello del 2020 è pari a 4.166336e-09 (0.0000004166%).
Per far comprendere meglio quanto piccolo sia questo numero, consideriamo che la probabilità totale sia rappresentata da una strada lunga 10 km; in questo caso, la probabilità di ottenere un numero di morti maggiore di 630,000, come da esempio, è data dagli ultimi 5.3 km, mentre quella relativa al numero reale di morti del 2020 è data dagli ultimi 4 mm (millimetri!). 
Bene, a questo punto dovrebbe essere chiaro che l’impatto di questa “banale influenza” sul nostro paese non sia stato per nulla irrisorio.

### “Se avevi un infarto e il tampone positivo, ti inserivano nei decessi “Covid” per gonfiare i numeri”
Ed eccoci arrivati alla seconda parte del ritornello tanto ripetuto da coloro che sostengono sia tutta una grande farsa.
Poniamo per assurdo che questa affermazione sia vera, e che quindi i numeri dei morti a causa del Covid siano stati gonfiati. Seguendo questa ipotesi, il numero di decessi dichiarati “Covid” dovrebbe essere *superiore* alla differenza che c’è tra il numero di morti nel 2020 e la media 2011-2019. Analizzando questi dati, emerge che i decessi dichiarati “Covid” sono stati 75,891 ([fonte](https://www.istat.it/it/files//2020/03/tabella-decessi-provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo.xlsx)), e che la differenza tra questo dato e quello relativo alla media degli anni precedenti è di circa 114,910 unità. In pratica, escludendo le morti dichiarate “Covid”, sembrano esserci 39,019 morti in più rispetto alla media del periodo 2011-2019 e 10,782 rispetto al famigerato 2017.
Siamo dunque in una situazione esattamente opposta rispetto a quella dell’ipotesi iniziale: non sono stati gonfiati i morti di Covid, anzi, è più probabile che siano stati sottostimati a causa dell’impossibilità di eseguire tamponi a tutti nelle fasi iniziali, e/o che la pressione ospedaliera provocata dalla pandemia abbia diminuito la capacità di servizio del sistema sanitario, causando così un aumento della mortalità generale.
Quindi, non solo il Covid ha causato **direttamente** la morte di almeno 75 mila persone, ma ha anche **indirettamente** provocato la morte di circa 10 mila persone in più rispetto al 2017, e di 40 mila rispetto alla media degli anni precedenti.

Qualcuno potrebbe obiettare dicendo che è stato un anno particolarmente “nefasto” in generale, non a causa del Covid.
Per smentire questa possibilità, analizziamo i seguenti grafici:
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/andamento_it.png" width="700"/> 

Il primo grafico è relativo all’andamento della mortalità totale per ogni mese. In verde abbiamo l’andamento della mortalità totale del 2020, in rosso quello della media del quinquennio 2015-2019, mentre in blu è evidenziato l’andamento della mortalità associata a Covid, secondo i criteri definiti.
Si vede come il 2020 si differenzi rispetto al quinquennio 2015-2019 grazie a due picchi: il primo in corrispondenza di marzo/aprile, il secondo di novembre. Nei mesi da maggio a settembre, invece, le due linee sono praticamente sovrapposte, evidenziando come il 2020 sia esattamente in linea rispetto al quinquennio precedente in quel periodo.
Da qui si può dedurre come il 2020 non sia stato un anno “nefasto” in generale, ma che piuttosto qualcosa è successo nei due periodi di “picco”.
Per cercare di capire cosa sia successo, osserviamo la linea blu del primo grafico (relativa al numero di decessi “Covid”): si possono notare due picchi in corrispondenza di marzo/aprile e novembre, proprio come nella linea verde! 
Per questo motivo, sottraendo i valori dei decessi “Covid” (linea blu) a quelli dei decessi totali del 2020 (linea verde), otteniamo il secondo grafico. Come si può notare, l’andamento dei decessi del 2020 al netto dei decessi “Covid” è simile a quello della media dei 5 anni precedenti. Il picco di novembre sparisce quasi del tutto, mentre rimane un picco notevole a marzo, che ci conferma quanto i decessi “Covid” possano essere stati in parte sottostimati e/o quanto sia stato l’effetto della pressione sul sistema sanitario.
Tutti questi indizi portano a concludere che le persone in quei periodi di picco siano morte PER Covid e non CON Covid, altrimenti come si spiegherebbe un aumento così importante della mortalità totale proprio in corrispondenza dei picchi di mortalità legati al Covid?


</div>











