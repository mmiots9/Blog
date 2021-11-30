---
title: "Ottenere informazioni su un oggetto di una partita"
h1title: "Giocatori, data, ID e altro di una partita/set/leg"
subtitle: "Come ottenere queste informazioni con funzioni specifiche"
date: 2021-11-04
modified: 
description: "Come ottenere queste informazioni con funzioni specifiche"
draft: false
hideToc: true
enableToc: true
enableTocContent: false
tocFolding: false
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- R
- Darts
- Pacchetti
- Partita
- Player
series:
- mdarts
categories:
- I miei pacchetti
image: "/images/R/miei_codici/mdarts/getOptions/cover.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

<div style="text-align: justify;">


Dopo aver visto in questo <a href="https://miotsdata.netlify.app/it/r/miei_pacchetti/mdarts/match/" target="_blank">post</a> come creare una partita, oggi analizziamo tutte le funzioni che ci permettono di maneggiare l'oggetto salvato di classe <i>match2p</i> e le relative sottoclassi (non vi preoccupate se non ve le ricordate, <a href="#scheme">questo</a> schema vi aiuterà).

## SaveMatch
<p style="margin:0px">Se una volta finita la partita si decide di salvare il risultato (l'oggetto <i>match2p</i> che si è creato) si potrebbe tranquillamente salvare l'intero environment in un file .RData; ma c'è un modo più pratico: usare la funzione `saveMatch`.  <br>
La praticità di questa funzione risiede in 3 caratteristiche principali:</p>
<li>Salvare la partita designata e <u>non</u> l'intero environment, grazie ai due input da fornire: quale partita e il file di destinazione</li>
<li>Creare un file di testo <u>leggibile</u> anche in macchine che non hanno R</li>
<li>Occupare <u>meno spazio</u> rispetto al file .RData contenente solo l'oggetto della partita</li>

<p style="margin:0px">Ma come fa ad occupare meno spazio? Seguendo uno schema preciso e che contiene solo i caratteri necessari; infatti, per ogni leg di ogni giocatore vengono create due righe:</p>
<ol>
<li>Leg ID, nome del giocatore, se ha iniziato lui (1) o meno (0) quel leg, se quel leg è stato vinto (1) o perso (0)</li>
<li>Sequenza delle frecce tirate separate da una virgola (,)</li>
</ol>

<figure id="filestr">
  <img src="/images/R/miei_codici/mdarts/getOptions/filestr.png" alt="Struttura file Match" width=90%>
  <figcaption style="text-align:center;">Figura 1: Struttura di un leg nel file salvato</figcaption>
</figure>


Per esempio, usando il comando `saveMatch(match, file = "filename.txt")` verrà creato il file <i>filename.txt</i> che conterrà la lista dei leg come in figura <a href="#filestr">1</a>.

## LoadMatch
Ovviamente, c'è bisogno di una funzione che trasformi i file salvati con la funzione precedente in oggetti di tipo <i>match2p</i> caricandoli su R. Questa funzione si chiama `loadMatch`. La sua peculiarità è che può sia avere come input il nome del file, sia non avere alcun input e uscirà una finestra di dialogo tramite la quale selezionare il file.  

<div class="notices warning" data-title="Importante" style="margin:0px;">
Come nel caso della creazione della partita, per usi successivi, è fortemente consigliato lanciare il comando salvando il risultato in una variabile: <code>var <- loadMatch(input)</code>
</div>

## Funzioni utili
Veniamo ora alle funzioni che ci permettono di ricavare informazioni dai match/set/leg. Come reminder, ecco lo schema della struttura delle classi:

<figure id="scheme">
  <img src="/images/R/miei_codici/mdarts/match/scheme.png" alt="Schema delle classi" width=90%>
  <figcaption style="text-align:center;">Figura 2: Schema della struttura e delle relazioni tra le classi</figcaption>
</figure>

Con questo schema in mente, andiamo a creare vari oggetti di diverse classi e analizziamo quali informazioni possiamo ricavare tramite funzioni specifiche. Con la funzione `loadMatch` carico un file di una partita (classe *match2p*), successivamente creo oggetti di classe *match1p*, *set1p* e *leg1p*:

<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span><span class="lnt">3
</span><span class="lnt">4
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-r" data-lang="Codice"><span class="n">m2p</span> <span class="o">&lt;-</span> <span class="nf">loadMatch</span><span class="p">(</span><span class="s">"match.txt"</span><span class="p">)</span> <span class="c1"># match intero</span>
<span class="n">m1p</span> <span class="o">&lt;-</span> <span class="n">m2p</span><span class="o">@</span><span class="n">p1match</span>            <span class="c1"># match del giocatore 1</span>
<span class="n">s1p</span> <span class="o">&lt;-</span> <span class="n">m1p</span><span class="o">@</span><span class="n">sets[[1]]</span>          <span class="c1"># primo set del giocatore 1</span>
<span class="n">l1p</span> <span class="o">&lt;-</span> <span class="n">s1p</span><span class="o">@</span><span class="n">legs[[1]]</span>          <span class="c1"># primo leg del primo set del giocatore 1</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

### Show
<p style="margin-bottom:3px">La funzione <i>show</i> è la funzione implicita che R usa quando si lancia come comando il nome di una variabile. Ogni classe ha un modo diverso di presentarsi, pur con alcune caratteristiche comuni:</p>

<div id="0fa06ef53ae6dc58" class="tab" style="margin:0px">
  <div class="tab__links">
  <button class="tab__link active" aria-label="Tab link" id="856df9eb3ec9f916">Match2p</button>
  <button class="tab__link" aria-label="Tab link" id="681fec6f465f1c34">Match1p</button>
  <button class="tab__link" aria-label="Tab link" id="723d4595fc2e2181">Set1p</button>
  <button class="tab__link" aria-label="Tab link" id="l1p">Leg1p</button>
  </div>
  
  
<div id="856df9eb3ec9f916" class="tab__content active" style="display: block;">
  <h3 id="windows-section">Match2p<span class="anchor hide" data-clipboard-text="https://themes.gohugo.io//theme/hugo-theme-zzo/en/posts/shortcodes/#windows-section" style="position: relative;"><span style="position: absolute; top: 50%; left: 0.75rem; transform: translateY(-50%); right: -2rem;">
<svg fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26px" height="26px"><path d="M 5.5625 0 C 4.136719 0 2.707031 0.542969 1.625 1.625 C -0.539063 3.789063 -0.539063 7.335938 1.625 9.5 L 5.28125 13.15625 C 5.667969 13.554688 6.304688 13.558594 6.703125 13.171875 C 7.101563 12.785156 7.105469 12.148438 6.71875 11.75 L 3.03125 8.0625 C 1.632813 6.664063 1.632813 4.429688 3.03125 3.03125 C 4.429688 1.632813 6.664063 1.632813 8.0625 3.03125 L 12.96875 7.9375 C 14.367188 9.335938 14.367188 11.570313 12.96875 12.96875 C 12.804688 13.132813 12.621094 13.25 12.4375 13.375 C 11.980469 13.6875 11.859375 14.308594 12.171875 14.765625 C 12.484375 15.222656 13.105469 15.34375 13.5625 15.03125 C 13.847656 14.835938 14.125 14.625 14.375 14.375 C 16.539063 12.210938 16.539063 8.664063 14.375 6.5 L 9.5 1.625 C 8.417969 0.542969 6.988281 0 5.5625 0 Z M 10.78125 8.875 C 10.738281 8.882813 10.695313 8.894531 10.65625 8.90625 C 10.507813 8.9375 10.371094 9 10.25 9.09375 C 10.039063 9.253906 9.820313 9.429688 9.625 9.625 C 7.460938 11.789063 7.460938 15.335938 9.625 17.5 L 14.5 22.375 C 16.664063 24.539063 20.210938 24.539063 22.375 22.375 C 24.539063 20.210938 24.539063 16.664063 22.375 14.5 L 18.71875 10.875 C 18.476563 10.578125 18.089844 10.441406 17.714844 10.527344 C 17.34375 10.613281 17.050781 10.90625 16.964844 11.277344 C 16.878906 11.652344 17.015625 12.039063 17.3125 12.28125 L 20.96875 15.9375 C 22.367188 17.335938 22.367188 19.570313 20.96875 20.96875 C 19.570313 22.367188 17.335938 22.367188 15.9375 20.96875 L 11.03125 16.0625 C 9.632813 14.664063 9.632813 12.429688 11.03125 11.03125 C 11.152344 10.90625 11.300781 10.820313 11.4375 10.71875 C 11.839844 10.472656 12.015625 9.976563 11.855469 9.53125 C 11.699219 9.085938 11.25 8.8125 10.78125 8.875 Z"></path></svg></span></span></h3>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="n">m2p</span> <span class="c1"># oppure</span>
<span class="nf">show</span><span class="p">(</span><span class="n">m2p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">Date: 2021-08-27 
Players: matteo, simone 
 
Match won by matteo 2-0</code></pre>
</div></div>

</div>
  
<div id="681fec6f465f1c34" class="tab__content" style="display: none;">
  <h3 id="macos-section">Match1p<span class="anchor hide" data-clipboard-text="https://themes.gohugo.io//theme/hugo-theme-zzo/en/posts/shortcodes/#macos-section" style="position: relative;"><span style="position: absolute; top: 50%; left: 0.75rem; transform: translateY(-50%); right: -2rem;">
<svg fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26px" height="26px"><path d="M 5.5625 0 C 4.136719 0 2.707031 0.542969 1.625 1.625 C -0.539063 3.789063 -0.539063 7.335938 1.625 9.5 L 5.28125 13.15625 C 5.667969 13.554688 6.304688 13.558594 6.703125 13.171875 C 7.101563 12.785156 7.105469 12.148438 6.71875 11.75 L 3.03125 8.0625 C 1.632813 6.664063 1.632813 4.429688 3.03125 3.03125 C 4.429688 1.632813 6.664063 1.632813 8.0625 3.03125 L 12.96875 7.9375 C 14.367188 9.335938 14.367188 11.570313 12.96875 12.96875 C 12.804688 13.132813 12.621094 13.25 12.4375 13.375 C 11.980469 13.6875 11.859375 14.308594 12.171875 14.765625 C 12.484375 15.222656 13.105469 15.34375 13.5625 15.03125 C 13.847656 14.835938 14.125 14.625 14.375 14.375 C 16.539063 12.210938 16.539063 8.664063 14.375 6.5 L 9.5 1.625 C 8.417969 0.542969 6.988281 0 5.5625 0 Z M 10.78125 8.875 C 10.738281 8.882813 10.695313 8.894531 10.65625 8.90625 C 10.507813 8.9375 10.371094 9 10.25 9.09375 C 10.039063 9.253906 9.820313 9.429688 9.625 9.625 C 7.460938 11.789063 7.460938 15.335938 9.625 17.5 L 14.5 22.375 C 16.664063 24.539063 20.210938 24.539063 22.375 22.375 C 24.539063 20.210938 24.539063 16.664063 22.375 14.5 L 18.71875 10.875 C 18.476563 10.578125 18.089844 10.441406 17.714844 10.527344 C 17.34375 10.613281 17.050781 10.90625 16.964844 11.277344 C 16.878906 11.652344 17.015625 12.039063 17.3125 12.28125 L 20.96875 15.9375 C 22.367188 17.335938 22.367188 19.570313 20.96875 20.96875 C 19.570313 22.367188 17.335938 22.367188 15.9375 20.96875 L 11.03125 16.0625 C 9.632813 14.664063 9.632813 12.429688 11.03125 11.03125 C 11.152344 10.90625 11.300781 10.820313 11.4375 10.71875 C 11.839844 10.472656 12.015625 9.976563 11.855469 9.53125 C 11.699219 9.085938 11.25 8.8125 10.78125 8.875 Z"></path></svg></span></span></h3>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="n">m1p</span> <span class="c1"># oppure</span>
<span class="nf">show</span><span class="p">(</span><span class="n">m1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>
<div class="highlight"><div class="chroma">
<pre class="chroma"><code class="language-R" data-lang="Risultato">Date: 2021-08-27 
Player: matteo 
Match won 2-0 with an avarage of 157.58 </code></pre>
</div></div>

</div>
  
<div id="723d4595fc2e2181" class="tab__content" style="display: none;">
  <h3 id="ubuntu-section">Set1p<span class="anchor hide" data-clipboard-text="https://themes.gohugo.io//theme/hugo-theme-zzo/en/posts/shortcodes/#ubuntu-section" style="position: relative;"><span style="position: absolute; top: 50%; left: 0.75rem; transform: translateY(-50%); right: -2rem;">
<svg fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26px" height="26px"><path d="M 5.5625 0 C 4.136719 0 2.707031 0.542969 1.625 1.625 C -0.539063 3.789063 -0.539063 7.335938 1.625 9.5 L 5.28125 13.15625 C 5.667969 13.554688 6.304688 13.558594 6.703125 13.171875 C 7.101563 12.785156 7.105469 12.148438 6.71875 11.75 L 3.03125 8.0625 C 1.632813 6.664063 1.632813 4.429688 3.03125 3.03125 C 4.429688 1.632813 6.664063 1.632813 8.0625 3.03125 L 12.96875 7.9375 C 14.367188 9.335938 14.367188 11.570313 12.96875 12.96875 C 12.804688 13.132813 12.621094 13.25 12.4375 13.375 C 11.980469 13.6875 11.859375 14.308594 12.171875 14.765625 C 12.484375 15.222656 13.105469 15.34375 13.5625 15.03125 C 13.847656 14.835938 14.125 14.625 14.375 14.375 C 16.539063 12.210938 16.539063 8.664063 14.375 6.5 L 9.5 1.625 C 8.417969 0.542969 6.988281 0 5.5625 0 Z M 10.78125 8.875 C 10.738281 8.882813 10.695313 8.894531 10.65625 8.90625 C 10.507813 8.9375 10.371094 9 10.25 9.09375 C 10.039063 9.253906 9.820313 9.429688 9.625 9.625 C 7.460938 11.789063 7.460938 15.335938 9.625 17.5 L 14.5 22.375 C 16.664063 24.539063 20.210938 24.539063 22.375 22.375 C 24.539063 20.210938 24.539063 16.664063 22.375 14.5 L 18.71875 10.875 C 18.476563 10.578125 18.089844 10.441406 17.714844 10.527344 C 17.34375 10.613281 17.050781 10.90625 16.964844 11.277344 C 16.878906 11.652344 17.015625 12.039063 17.3125 12.28125 L 20.96875 15.9375 C 22.367188 17.335938 22.367188 19.570313 20.96875 20.96875 C 19.570313 22.367188 17.335938 22.367188 15.9375 20.96875 L 11.03125 16.0625 C 9.632813 14.664063 9.632813 12.429688 11.03125 11.03125 C 11.152344 10.90625 11.300781 10.820313 11.4375 10.71875 C 11.839844 10.472656 12.015625 9.976563 11.855469 9.53125 C 11.699219 9.085938 11.25 8.8125 10.78125 8.875 Z"></path></svg></span></span></h3>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="n">s1p</span> <span class="c1"># oppure</span>
<span class="nf">show</span><span class="p">(</span><span class="n">s1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">
<pre class="chroma"><code class="language-R" data-lang="Risultato">Date: 2021-08-27 
Player: matteo 
Set won 3-0 with an avarage of 149.1 </code></pre>
</div></div></div>

<div id="l1p" class="tab__content" style="display: none;">
  <h3 id="l1ps">Leg1p<span class="anchor hide" data-clipboard-text="https://themes.gohugo.io//theme/hugo-theme-zzo/en/posts/shortcodes/#ubuntu-section" style="position: relative;"><span style="position: absolute; top: 50%; left: 0.75rem; transform: translateY(-50%); right: -2rem;">
<svg fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26px" height="26px"><path d="M 5.5625 0 C 4.136719 0 2.707031 0.542969 1.625 1.625 C -0.539063 3.789063 -0.539063 7.335938 1.625 9.5 L 5.28125 13.15625 C 5.667969 13.554688 6.304688 13.558594 6.703125 13.171875 C 7.101563 12.785156 7.105469 12.148438 6.71875 11.75 L 3.03125 8.0625 C 1.632813 6.664063 1.632813 4.429688 3.03125 3.03125 C 4.429688 1.632813 6.664063 1.632813 8.0625 3.03125 L 12.96875 7.9375 C 14.367188 9.335938 14.367188 11.570313 12.96875 12.96875 C 12.804688 13.132813 12.621094 13.25 12.4375 13.375 C 11.980469 13.6875 11.859375 14.308594 12.171875 14.765625 C 12.484375 15.222656 13.105469 15.34375 13.5625 15.03125 C 13.847656 14.835938 14.125 14.625 14.375 14.375 C 16.539063 12.210938 16.539063 8.664063 14.375 6.5 L 9.5 1.625 C 8.417969 0.542969 6.988281 0 5.5625 0 Z M 10.78125 8.875 C 10.738281 8.882813 10.695313 8.894531 10.65625 8.90625 C 10.507813 8.9375 10.371094 9 10.25 9.09375 C 10.039063 9.253906 9.820313 9.429688 9.625 9.625 C 7.460938 11.789063 7.460938 15.335938 9.625 17.5 L 14.5 22.375 C 16.664063 24.539063 20.210938 24.539063 22.375 22.375 C 24.539063 20.210938 24.539063 16.664063 22.375 14.5 L 18.71875 10.875 C 18.476563 10.578125 18.089844 10.441406 17.714844 10.527344 C 17.34375 10.613281 17.050781 10.90625 16.964844 11.277344 C 16.878906 11.652344 17.015625 12.039063 17.3125 12.28125 L 20.96875 15.9375 C 22.367188 17.335938 22.367188 19.570313 20.96875 20.96875 C 19.570313 22.367188 17.335938 22.367188 15.9375 20.96875 L 11.03125 16.0625 C 9.632813 14.664063 9.632813 12.429688 11.03125 11.03125 C 11.152344 10.90625 11.300781 10.820313 11.4375 10.71875 C 11.839844 10.472656 12.015625 9.976563 11.855469 9.53125 C 11.699219 9.085938 11.25 8.8125 10.78125 8.875 Z"></path></svg></span></span></h3>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="n">l1p</span> <span class="c1"># oppure</span>
<span class="nf">show</span><span class="p">(</span><span class="n">l1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">Date: 2021-08-27 
Player: matteo 
 
Leg closed in 9 darts </code></pre>
</div></div></div>

</div>

<p style="margin-bottom:0px; margin-top:10px">Come si può notare, tutte contengono la data e i/il giocatore/i di riferimento. Quello che cambia è il messaggio sottostante:</p>

<li><i>match2p</i>: chi è il vincitore del match e il punteggio dei set</li>
<li> <i>match1p</i>: match vinto/perso, il punteggio dei set e la media delle 3 frecce</li>
<li> <i>set1p</i>: set vinto/perso, il punteggio dei leg e la media delle 3 frecce</li>
<li> <i>leg1p</i>: leg vinto/perso. Nel caso di vittoria viene mostrato in quante frecce si è chiuso</li>

### getPlayers
Se invece si vuole sapere a quale/i giocatore/i fa riferimento un oggetto (chi ha giocato quel match/set/leg), si usa la funzione `getPlayers(oggetto)`. Essa ritornerà un vettore contenente il/i nome/i del/i giocatore/i.

<p style="margin-bottom:0px">Per esempio:</p>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="nf">getPlayers</span><span class="p">(</span><span class="n">m2p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">[1] "matteo" "simone"</code></pre>
</div></div>

### getDate
Per ricavare la data in cui un certo evento ha preso luogo, la funzione `getDate(oggetto)` la fornirà in formato YYYY-MM-DD (character).  
<p style="margin-bottom:0px">In questo caso:</p>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="nf">getDate</span><span class="p">(</span><span class="n">m1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">[1] "2021-08-27"</code></pre>
</div></div>

### getWinner
Per ricavare il vincitore di un match (da usare **solo** con oggetti di classe *match2p*) si usa la funzione `getWinner(match)`.
<p style="margin-bottom:0px">In questo match:</p>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="nf">getWinner</span><span class="p">(</span><span class="n">m2p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">[1] "matteo"</code></pre>
</div></div>

### getWin
Per le altre classi invece si può ricavare se quel match/set/leg è stato vinto o perso usando la funzione `getWin(oggetto)`.  
<p style="margin-bottom:0px">Vediamo se il leg <i>l1p</i> è stato vinto o perso:</p>

<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Codice"><span class="nf">getWin</span><span class="p">(</span><span class="n">l1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">[1] 1</code></pre>
</div></div>

### getID
Veniamo ora all'ultima funzione di oggi: `getID`. Può essere utilizzata con tutte le classi come oggetto, e ritornerà l'ID di tale oggetto.  
Ma perchè è importante l'ID? L'ID è l'identificativo unico di un match/set/leg; può servire per vedere quali leg appartengono alla stessa partita o allo stesso set, per collegare due oggetti `leg1p` (nel caso in cui siano lo stesso leg ma di giocatori diversi).  
<p style="margin-bottom:0px">Una cosa importante da notare è la struttura dell'ID:</p>
<li>l'ID del match è costituito dalla lettera "m" seguita dalla data della partita in formato YYYYMMDD, dal simbolo ":" e dall'ora dell'inizio del match, in formato HHMMSS</li>
<li>l'ID del set è formato dall'ID del match corrispondente, seguito dalla lettera "s" e dal numero del set nel match</li>
<li>l'ID del leg è formato dall'ID del set di riferimento, seguito dalla lettera "l" e dal numero del leg nel set</li>

Ne deriva che dall'ID del leg si può ricavare sia l'ID del set che del match dei quali fa parte.

<p style="margin-bottom:0px">Vediamo un piccolo esempio:</p>

<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-r" data-lang="Codice"><span class="nf">getID</span><span class="p">(</span><span class="n">l1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>
<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Risultato">[1] "m20210827:161940s1l1"</code></pre>
</div></div>

## Conclusioni
In questo post abbiamo visto un po' di funzioni utili per ricavare varie informazioni dagli oggetti delle classi del pacchetto. Ma tra queste informazioni mancano le statistiche del match, del set o del leg; queste possono essere ricavate con altre funzioni, di cui vi parlerò in un post dedicato.  
Stay tuned!


</div>