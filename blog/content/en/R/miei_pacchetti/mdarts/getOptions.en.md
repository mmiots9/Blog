---
title: "Getting info from package classes"
h1title: "Players, date, ID and more of a match/set/leg"
subtitle: "How to get this information with specific functions"
date: 2021-11-30
modified: 
description: "How to get this information with specific functions"
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
- Packages
- Match
- Player
series:
- mdarts
categories:
- My own packages
image: "/images/R/miei_codici/mdarts/getOptions/cover.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

<div style="text-align: justify;">


Having seen in this <a href="https://miotsdata.netlify.app/en/r/miei_pacchetti/mdarts/match/" target="_blank">post</a> how to create a match, today we analyze all the functions that allow us to manage the saved object of class <i>match2p</i> and its subclasses (don't worry if you don't remember them, <a href="#scheme">this</a> scheme will help you).

## SaveMatch
<p style="margin:0px">If, once the game is over, you decide to save the result (the <i>match2p</i>-class object you created) you could easily save the entire environment in an .RData file; but there is a more practical way: to use the function `saveMatch`.  <br>
The advantages of this function lie in 3 main features:</p>
<li>Save the desired game and <u>not</u> the entire environment, thanks to the two inputs to be provided: which game and the destination file</li>
<li>Create a text file <u>readable</u> even on machines that don't have R</li>
<li>Take up <u>less space</u> than the .RData file containing only the match object</li>

<p style="margin:0px">But how does it occupy less space? Using a precise pattern that contains only the necessary characters; in fact, for each leg of each player two lines are created:</p>
<ol>
<li>Leg ID, player name, if he started that leg (1) or not (0), if that leg was won (1) or lost (0)</li>
<li>Sequence of darts scores separated by a comma (,)</li>
</ol>

<figure id="filestr">
  <img src="/images/R/miei_codici/mdarts/getOptions/filestr.png" alt="Match file structure" width=90%>
  <figcaption style="text-align:center;">Figure 1: Leg structure in the saved file</figcaption>
</figure>


For example, using the command `saveMatch(match, file = "filename.txt")` the file <i>filename.txt</i> will be created and it will contain the list of legs as shown in the figure <a href="#filestr">1</a>.

## LoadMatch
Obviously, we need a function that transforms files saved with the previous function into objects of type <i>match2p</i> by loading them to R. This function is called `loadMatch`. Its peculiarity is that it can either have the name of the file as input or have no input and a dialog box will come out through which to select the file.  

<div class="notices warning" data-title="Important" style="margin:0px;">
As in the case of the creation of the match, for subsequent uses, it is strongly recommended to run the command by saving the result in a variable: <code>var <- loadMatch(input)</code>
</div>

## Useful functions
Let's move to the functions that allow us to obtain information from the match/set/leg. As a reminder, here is the outline of the class structure:

<figure id="scheme">
  <img src="/images/R/miei_codici/mdarts/match/scheme.png" alt="Scheme of the classes" width=90%>
  <figcaption style="text-align:center;">Figure 2: Scheme of the structure of the classes and their nesting</figcaption>
</figure>

With this scheme in mind, let's create various objects of different classes and analyze what information we can derive through specific functions. With the `loadMatch` function I load a file of a match (class *match2p*), then I create class objects *match1p*, *set1p* and *leg1p*:

<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span><span class="lnt">3
</span><span class="lnt">4
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-r" data-lang="Code"><span class="n">m2p</span> <span class="o">&lt;-</span> <span class="nf">loadMatch</span><span class="p">(</span><span class="s">"match.txt"</span><span class="p">)</span> <span class="c1"># full match</span>
<span class="n">m1p</span> <span class="o">&lt;-</span> <span class="n">m2p</span><span class="o">@</span><span class="n">p1match</span>            <span class="c1"># match of player 1</span>
<span class="n">s1p</span> <span class="o">&lt;-</span> <span class="n">m1p</span><span class="o">@</span><span class="n">sets[[1]]</span>          <span class="c1"># first set of player 1</span>
<span class="n">l1p</span> <span class="o">&lt;-</span> <span class="n">s1p</span><span class="o">@</span><span class="n">legs[[1]]</span>          <span class="c1"># first leg of first set of player 1</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

### Show
<p style="margin-bottom:3px">The <i>show</i> function is the implicit function that R uses when using a variable name as a command. Each class has a different way of presenting itself, albeit with some common characteristics:</p>

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
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="n">m2p</span> <span class="c1"># or</span>
<span class="nf">show</span><span class="p">(</span><span class="n">m2p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">Date: 2021-08-27 
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
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="n">m1p</span> <span class="c1"># or</span>
<span class="nf">show</span><span class="p">(</span><span class="n">m1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>
<div class="highlight"><div class="chroma">
<pre class="chroma"><code class="language-R" data-lang="Result">Date: 2021-08-27 
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
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="n">s1p</span> <span class="c1"># or</span>
<span class="nf">show</span><span class="p">(</span><span class="n">s1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">
<pre class="chroma"><code class="language-R" data-lang="Result">Date: 2021-08-27 
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
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="n">l1p</span> <span class="c1"># or</span>
<span class="nf">show</span><span class="p">(</span><span class="n">l1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">Date: 2021-08-27 
Player: matteo 
 
Leg closed in 9 darts </code></pre>
</div></div></div>

</div>

<p style="margin-bottom:0px; margin-top:10px">As you can see, they all contain the date and player(s) of the input variable. What changes is the message below them:</p>

<li><i>match2p</i>: who is the winner of the match and the score of the sets</li>
<li> <i>match1p</i>: match won/lost, the score of the sets and the average of the 3 darts</li>
<li> <i>set1p</i>: set won/lost, the score of the legs and the average of the 3 darts</li>
<li> <i>leg1p</i>: leg won/lost. In case of victory it is shown in how many arrows it is closed</li>

### getPlayers
If you want to know which player(s) an object refers to (who played that match/set/leg), use the `getPlayers(object)` function. It will return a vector containing the name(s) of the player(s).

<p style="margin-bottom:0px">Per esempio:</p>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre><span class="copy-to-clipboard" title="Copy to clipboard"></span></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="nf">getPlayers</span><span class="p">(</span><span class="n">m2p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">[1] "matteo" "simone"</code></pre>
</div></div>

### getDate
To get the date on which a certain event took place, the `getDate(object)` function will provide it in the format YYYY-MM-DD (character).  
<p style="margin-bottom:0px">In this case:</p>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="nf">getDate</span><span class="p">(</span><span class="n">m1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">[1] "2021-08-27"</code></pre>
</div></div>

### getWinner
To find the winner of a match (to be used **only** with objects of class *match2p*) use the function `getWinner(match)`.
<p style="margin-bottom:0px">In this match:</p>
<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="nf">getWinner</span><span class="p">(</span><span class="n">m2p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">[1] "matteo"</code></pre>
</div></div>

### getWin
For the other classes, you can find out if that match/set/leg has been won or lost using the function `getWin(object)`.  
<p style="margin-bottom:0px">Let's see if the leg <i>l1p</i> was won or not:</p>

<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-R" data-lang="Code"><span class="nf">getWin</span><span class="p">(</span><span class="n">l1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>

<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">[1] 1</code></pre>
</div></div>

### getID
Here we are at today's last function: `getID`. It can be used with all classes as an object, and will return the ID of that object.
But, why is the ID so important? The ID is the unique identifier of a match/set/leg; it can be used to see which legs belong to the same game or set, to link two `leg1p` objects (in case they are the same leg but from different players).  
<p style="margin-bottom:0px">An important thing to note is the structure of the ID:</p>
<li>the match ID consists of the letter "m" followed by the match date in YYYYMMDD format, the ":" symbol and the match start time, in HHMMSS format</li>
<li>the set ID is made up of the corresponding match ID, followed by the letter "s" and the set number in the match</li>
<li>the leg ID is made up of the corresponding set ID, followed by the letter "l" and the number of the leg in the set</li>

It follows that from the ID of the leg it is possible to obtain both the ID of the set and of the match of which it is taken from.

<p style="margin-bottom:0px">An example:</p>

<div class="highlight"><div class="chroma">
<table class="lntable"><tbody><tr><td class="lntd">
<div data-lang="Code" class="language-code"><pre class="chroma"><code><span class="lnt">1
</span></code></pre></div></td>
<td class="lntd">
<pre class="chroma"><code class="language-r" data-lang="Code"><span class="nf">getID</span><span class="p">(</span><span class="n">l1p</span><span class="p">)</span>
</code></pre></td></tr></tbody></table>
</div>
</div>
<div class="highlight"><div class="chroma">

<pre class="chroma"><code class="language-R" data-lang="Result">[1] "m20210827:161940s1l1"</code></pre>
</div></div>

## Conclusions
In this post we have seen some useful functions to get various information from the objects of the package classes. But among this information the statistics of the match, the set or the leg are missing; these can be obtained with other functions, which I will describe in a separate post.
Stay tuned!


</div>