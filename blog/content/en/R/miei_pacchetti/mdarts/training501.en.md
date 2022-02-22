---
title: "Function for a single-leg 501 training"
h1title: "Training501: the function for a training leg"
date: 2022-02-22
modified: 
description: "Description and use of the function to play a training leg"
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
- Training
series:
- mdarts
categories:
- My own packages
image: "/images/R/miei_codici/mdarts/training501.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---

<div style="text-align: justify;">

Today we see the *training501* function, which allows us to perform training legs at the classic 501 darts game.

## Function launch and input
<p style="margin-bottom:0px;"> Let's start with the launch of the function and the necessary inputs. The function will be launched with the command <code>training501(input)</code> and it will have the following inputs: </p>
<li><i>player</i>: player namee</li>
<li><i>save</i>: if training leg must be stored in a text file. T by default</li>
<li><i>file</i>: (optional). Name of the file in which to save the training. By default it is NA, if save = T and file = NA, a prompt will ask you to select the destination file</li>

<div class="notices warning" data-title="Important" style="margin:0px;">
For later use, it is strongly recommended to run the command saving the result in a variable: <br><code>var <- training501(input)</code>
</div>

## Instructions and darts scores values entry
The way of entering values is the same as that used for the function <a href="https://miotsdata.netlify.app/en/r/miei_pacchetti/mdarts/match/#instructions-and-darts-scores-values-entry" target='_blank'>match_501</a>. 

<p style="margin-bottom:0px;">Once the values have been entered, the function will perform the following operations:<p>
<ol>
<li>Check that the entered values are valid (right shape and existing numbers). Otherwise, an error message will be issued and the player will be prompted to re-enter the values of the three darts</li>
<li>Check that the player has not busted</li>
<li>Subtract the value from the player's score and move on to the next visit</li>
<li>(In closing) Check that 0 has been reached with a double</li>
</ol>

## End of the training
Once the training is finished, an object of class *legtr* will be returned. If the object has been saved in a variable, it will only show that the training is over, otherwise a message will be shown that presents the date, the player's name and the number of darts used to close.


## File saving
<p style="margin-bottom:0px;">If you decide to save the workout to a file, the function will add 2 lines of text to that file. In details:</p>
<li>First line: leg id, player name</li>
<li>Second row: darts thrown, in the form 18, t19, d20, ...</li>

## Get info on training leg
To get information about the leg, you can use some of the get functions described in this <a href="https://miotsdata.netlify.app/en/r/miei_pacchetti/mdarts/getoptions/#useful-functions" target='_blank'>post</a> (getPlayers, getID, getDate). 

</div>