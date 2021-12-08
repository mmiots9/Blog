---
title: "Manage git and github repo"
h1title: "Repoinfo and topush: functions for managing local repo and github"
subtitle: "How to find out which is the latest remote commit and if there are local commits to push"
date: 2021-12-08
description: "How to find out which is the latest remote commit and if there are local commits to push"
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
- Terminal
- Zsh
- Github
- Repository
series:
- My bash functions
categories:
- Bash
image: "/images/Bash/gitInfo/cover.en.png"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

This post is for those who, like me, have lots of a repository on github and/or either collaborate with a team, or have multiple PCs on which they want to pass the latest repo news.
I'll talk about two functions that I have developed that have become necessary (if not fundamental) to keep the local repos in order.
These functions are called *repoinfo* and *topush*, and are found in the *git-info.sh* file of the repo at <a href="https://github.com/mmiots9/bash-functions" target="_blank">github</a>. Let's see them together!

## Repoinfo
Let's start with *repoinfo*. This function was born precisely because I wanted to know if the latest commit pushed was done by one pc or the other, in order to know if I had to pull <u>before</u> to start working or not.
But what does it do? The concept is simple: via the github API it prints on the screen one line for each github repo, even the **private** ones, containing the following information about the <u>latest</u> commit:<br> <span style="color:red">Repo name</span>: pushed by <span style="color:green">commit author</span> on <span style="color:#D788FC">commit date</span> at <span style="color:#D788FC">time</span>: commit message.

Once the file has been downloaded, you will first need to set 2 settings:

<figure id="settaggi_iniziali">
  <img src="/images/Bash/gitInfo/repoinfoset.png" alt="First things to set in repoinfo" width=90%>
  <figcaption style="text-align:center;">Figure 1: intitial settings for the function repoinfo</figcaption>
</figure>
The first is your github token (if you don't know what it is or where to find it,<a href="https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token" target="_blank">here</a> there is the explanation), the second is your username on github. This information is<b>fundamental</b> to access the API.

Once these parameters have been set, just run the *repoinfo* command on the terminal and that's it. I suggest to look at the README.md file in my repository for instructions on the correct "installation" of the functions.

## Topush
Let's move on to *topush* now. This function was born with the idea of seeing if there were any untracked or committed files to push from the various local repos. Basically, the function looks for all the local git repo, and for each one it sees if there are any untracked or uncommitted files, or commits to be pushed.
What is printed on the screen is the result of the command <code>git status -bs --ahead-behind</code> for each repo.

Here an example:
<figure id="output_topush">
  <img src="/images/Bash/gitInfo/topush.png" alt="Output of topush function" width=80%>
  <figcaption style="text-align:center;">Figure 2: Example of the output of topush function</figcaption>
</figure>
In the image I applied a blur effect on "sensitive" data. Below the number is the name of the repo, followed by the name of the local and remote branches (line below visible). Then we see how in repo number 1 there is a file modified but not added to a commit; while repo 2 is fine and repo 3 instead has files that have never been tracked.
<br><br>

**Important**: For how this function works, it may be that a "temp-pull.txt" file (which if you notice well is the last file in the figure) comes out as untracked. Don't worry, it's a temporary file which is actually deleted at the end of the function.

<br>
In this case there is only one setting to be done, that is to add any folder names not to be traced in the function (everything is written in the script). This is to prevent all repositories not coming out of yours from being printed, but that you have because they are useful for you (for example vim plugins or others).


## Future improvements
Like any self-respecting function, there are certainly improvements that can be made. In this case they concern branches. In fact, both functions track only the branches active at that moment.
As for the *repoinfo* function, it will be easier to have a list of each repo and each branch, while for the *topush* function this is complicated, since you cannot checkout the active branch if there are files added but not committed, or files not even added or untracked. <br> It will be a good "challenge". So, as usual: stay tuned!



</div>