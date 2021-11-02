---
title: "The function for a 501 match"
h1title: "Match_501: the function for a classic 501 darts match"
subtitle: "How to play your first darts match"
date: 2021-11-03
modified: 
description: "How to use the function to play a match"
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
- Packages
- Match
series:
- mdarts
categories:
- My own packages
image: "images/R/miei_codici/mdarts/intro.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

<div style="text-align: justify;">

Here we are at the first post explaining this pack for the game of darts. Today we will see how to use the `match_501` function to play a classic game of darts and see the results.

## Function launch and input
<p style="margin-bottom:0px;">Let's start from the launch of the function and the necessary inputs. The function will be launched with the <code>match_501(input)</code> command and will have the following inputs:</p>
<li><i>player 1</i>: name of the first player, the one who <u>starts</u> the first leg</li>
<li><i>player 2</i>: name of the second player</li>
<li><i>sets2win</i>: number of sets needed to win the match, default is 1</li>
<li><i>legs2win</i>: number of legs needed to win a set, default is 1</li>

For example, by launching the command `match_501(player1 = "John", player2 = "Julie", sets2win = 2, legs2win = 3)` a match between John and Julie will be created, in which it is necessary to win 3 legs to win a set, and 2 sets to win the match.

<div class="notices warning" data-title="Important" style="margin:0px;">
For later use, it is strongly recommended to run the command saving the result in a variable: <code>var <- match_501(input)</code>
</div>

## Instructions and darts scores values entry
Once the function is launched, the instructions on how to enter the values of the darts thrown will appear first:

<figure id="instruction">
  <img src="/images/R/miei_codici/mdarts/match/instruction.png" alt="Instructions" width=90%>
  <figcaption style="text-align:center;">Figure 1: Instructions on how to enter the values of the darts</figcaption>
</figure>

At this point, by pressing enter the score table will appear and the first player will be asked to enter the scores of the darts (name shown on the screen):

<figure id="punteggio1">
  <img src="/images/R/miei_codici/mdarts/match/punteggio1.png" alt="Initial scoring scheme" width=90%>
  <figcaption style="text-align:center;">Figure 2: Initial scoring scheme</figcaption>
</figure>

<p style="margin-bottom:0px;">Once the values have been entered, the function will perform the following operations:<p>
<ol>
<li> Check that the entered values are valid (right shape and existing numbers). Otherwise, an error message will be issued and the player will be prompted to re-enter the values of the three darts </li>
<li> Check that the player has not busted </li>
<li> Subtract the value from the player's score and move on to the next player, updating the values of the score table </li>
<li> (On closing) Check that 0 has been reached with a double </li>
<li> (If leg is closed) Go to next leg/set </li>
</ol>

## End of the match
Once the match is over, a recap will be provided, indicating the date of the match, the players who took part in it and the winner (with the score):
<figure id="fine">
  <img src="/images/R/miei_codici/mdarts/match/fine.png" alt="End of the match" width=90%>
  <figcaption style="text-align:center;">Figure 3: End of the match and recap</figcaption>
</figure>
In the figure you can appreciate how the score is updated each visit, that at the end of each leg and set the winner is shown and that at the end of the game there is a recap. In this case, for demonstration purposes only, the game was won with only one leg per set and one set.


## Match, set and leg class
After seeing the simple steps required to make a game, I leave you introducing the classes that I have created to save the data of a game. These classes are *leg1p*, *set1p*, *match1p* and *match2p*, and they are all of type S4.
To help you understand the structure better, here is a scheme of their structure and the slots present in each:

<figure id="scheme">
  <img src="/images/R/miei_codici/mdarts/match/scheme.png" alt="Classh scheme" width=90%>
  <figcaption style="text-align:center;">Figure 4: Scheme of the structure and relationships between classes</figcaption>
</figure>

The structure is nested: the final object that is provided by the function is of class **match2p**. It contains the number of sets needed to win the game and a **match1p** class item for each player. It contains a victory indicator (1 if yes, 0 if lost) and a list of **set1p** items, one for each set. The structure of the latter object is similar to that of match1p: victory indicator and list of **leg1p** objects, one for each leg.  
This class contains much more information than the others: the ID of the leg, the name of the player, a numerical value that indicates whether he started that leg (1) or not (0), the victory indicator and a character vector containing the scores of the thrown darts.
For those unfamiliar with how to access the S4 object slots, I have also created functions to obtain these and other information. But this will be the subject of a future post, in which I will also talk about saving and loading this data.
Stay tuned!

</div>