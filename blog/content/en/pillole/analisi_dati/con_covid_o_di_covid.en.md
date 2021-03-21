---
title: "Death FROM Covid or WITH Covid?"
date: 2021-03-20
modified: 
description: 'Example of the importance of a good analysis to answer the question "FROM Covid or WITH Covid?"'
draft: false
hideToc: false
enableToc: true
enableTocContent: true
tocFolding: false
tocPosition: outer
tocLevels: ["h2", "h3", "h4"]
tags:
- Covid
- Death
- Fake news
series:
- Covid
categories:
- Data analysis pills
image: "/images/Pillole/Analisi_dati/di_covid_o_con_covid/coronavirus.jpg"
author: Matteo Miotto
authorEmoji: 🤖
authorImage: "/images/whoami/me.jpeg"
---
<div style="text-align: justify;">

As you can imagine from the title, the goal of this pill is to try to answer, through data analysis, to the question "are they dead FROM Covid or WITH Covid?".
Before anwering it, let0s take a step back.

### "It's only flu"
Yeah, this words came out from many people in the past year. They claimed that the impact of Covid was negligible, that was only a banal Flu. To efficiently contrast this claim, we can use this [file](https://www.istat.it/it/files//2020/03/Dataset-decessi-comunali-giornalieri-e-tracciato-record_5marzo.zip) form ISTAT (the italian statistic institute), in which mortality data from 2011 to 2020 in Italy are reported.
The best way to compare 2020 with the previous 9 years is to keep it aside and analyze the characteristics of the mortality distribution built over the period 2011-2019.
Through Shapiro-test for normality, we see that we have a normal distribution (W = 0.90009, p-value = 0.2525); so, we calculate mean and standard distribution (631,235.8 e 19,944.2 respectively) and we use them to describe the distribution.
In 2020, 746,146 deaths were registered; comparing it with the mean of the previous nine years (631,235.8), we see a **15.57% increase**. Evene comparing with the worst of them (2017, so loved by the fb-graduated experts), the increase is of 13.14%.
If this difference is not so clear as numbers, here we have a graph in which the normal distribution built over the parameters above is plotted.
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/distr_2011_201920.png" width="700"/>
The number of deaths in 2020 is highlighted in red; it is very far from the distribution, isn't it impressive?!
Going back to numbers, 2020 data is more than 5.5 sd far from the mean of the preious year, placing it at the 100th percentile of the distribution; the probability of having an even more right value is 4.166336e-09 (0.0000004166%). 
In order to make you realize how small is this number: imagine that the probability distribution is a 10km straight line, the 2020 data cuts this line almost 4 mm (millimiters!) form the end.

Ok, this should make you realize the impact of this "banal flu" in the mortality.

### "If you had an heart attack, they marked as Covid death to inflate the statistics"
And here we are at the second mantra for those who believe this is all a big invention.
Let's assume that this reasoning is true. Following this reasoning, the number of Covid death should be HIGHER than the difference between the number of death of 2020 and the mean of the previous years. 
Covid-declaired deaths were 75,891 ([source](https://www.istat.it/it/files//2020/03/tabella-decessi-provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo.xlsx)), while the difference between 2020 deaths and the mean of the past years is almost 114,910 (10,782 if we consider only 2017). They are even **more** than the Covid-declaired ones!
Not only this falsify their hypothesis, but put the basis on the oppiste one: Covid-declaired deaths are less than the real ones. This is possibly not true, beacuse we should talk about Covid-related deaths: in fact, Covid *directly* caused almost 75k deaths, but also it *indirectly* caused from 10k to 40k deaths (comparing 2017 and 2011-2019 mean respectively) because of its impact and pression on hospitals and health-care services.
Someone could say that it was an inauspicious year in general, not given by Covid.
To deny this hypothesis, let's analyze this graphs.
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/trend_en.png" width="700" height="500"/> 

In the plot above we have the mortality trend over different months. We can see how 2020 differs from the period 2015-2019 with two major peaks: the first at March/April, and the second in November. In the periodfrom may to September, the two lines are almost superimposable, meaning that there is no difference in mortality in that period. This should be already a proof that 2020 was not "inauspicious" in general.
The counter-proof is given by the blue line in the graph above and by all the graph below. In fact, the blue line representing Covid-confirmed death has two peaks (March/April and November) that resemble the ones of the green line. Moreover, the green line in the graph below is obtained subtracting Covid-declaired deaths to the total death of 2020. As we can see, the 2020 trend is very close to the mean of 2015-2019 period, with still peaks in March and November.
This means that people didn't die WITH Covid, otherwise we won't have peaks and the difference in terms of mortality would be minimal between overall mortality of 2020 and of the other years. So, people died FROM Covid, and Covid causes lots of indirect death.

</div>











