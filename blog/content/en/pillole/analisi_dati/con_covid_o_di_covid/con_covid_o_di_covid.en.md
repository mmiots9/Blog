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

As you can guess from the title, the goal of this pill is to try to answer, through data analysis, the famous question that has haunted us for a year: Did people die FROM Covid or WITH Covid?.
To answer it, we must first take a step back.

### "It's only flu"
Yeah, this words came out from many people in the past year. They claimed that the impact of Covid on our country was negligible, that was only a trivial flu. To efficiently contrast this claim, we can use this [file](https://www.istat.it/it/files//2020/03/Dataset-decessi-comunali-giornalieri-e-tracciato-record_5marzo.zip) form ISTAT (the italian statistic institute), in which mortality data from 2011 to 2020 in Italy are reported.
In order to better compare the data, it is advisable to first analyze those relating to mortality between 2011 and 2019, years in which the situation was "normal".
Thanks to the Shapiro-test, we can see that the data are distributed according to a normal distribution (W = 0.90009, p-value = 0.2525); the mean and the standard deviation, useful to describe this distribution, are respectively 631,235.8 and 19,944.2.
Let's now move on to 2020: unfortunately, 746,146 deaths were recorded; comparing this data with the average of the previous 9 years (631,235.8), we see an **increase of 15.57%** in the number of deaths. Even comparing these numbers to the worst of those 9 years, 2017, - as those who play with numbers on Facebook love to do so much - the increase is 13.14%.

To make these data even more clear, here is a graph showing the normal distribution constructed according to the above parameters (mean and standard deviation).
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/normal_en.png" width="850"/>

The red line shows where 2020 is placed compared to the previous 9 years, emphasizing how far from normal distribution. Isn't it impressive?!
Going back to numbers, 2020 data is found beyond 5.5 standard deviations with respect to the average of the 2011-2019 period, placing it at the 100th percentile of distribution.
Clarifying this last step: using the data of the 2011-2019 period the so-called "normal" distribution (with the classic bell shape) was built; it highlights the relationship between the number of deaths (X axis) and the associated probability (Y axis, not shown in the figure). This allows us to obtain the probability of having a precise number of deaths in a year, or the probability of having an higher or lower number.
For example, let's imagine to be at the end of 2019 (without Covid): we want to know what is the probability of having at least 630,000 deaths in 2020; thanks to this distribution we know that it is 53%.
Going back to reality, the probability of obtaining a number of deaths greater than that actually found in 2020 (red line) in a normal situation is 4.166336E-09 (0.0000004166%). To understand how small is this number: let's consider that the total probability is represented by a 10 km long road; in this case, the probability of obtaining a number of deaths greater than 630,000, as in the example, is represented by the last 5.3 km, while that relating to the real number of deaths of 2020 is given by the last 4 mm (millimeters!).
Well, at this point it should be clear that the impact of this "trivial influence" on our country has not been negligible at all.

### "If you had a heart attack and a positive test, they put to you in the "Covid" deaths to inflate the numbers"
And here we are at the second part of the refrain so repeated by those who claim both a great farce.

Let's assume that this statement is true, and therefore the numbers of the dead due to the Covid have been inflated. Following this hypothesis, the number of deaths declared "Covid" should be *higher* than the difference between the number of deaths in 2020 and the 2011-2019 average. Analyzing these data, it emerges that the "Covid" deaths were 75.891 ([source](https://www.istat.it/it/files//2020/03/tabella-decessi-provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo.xlsx)), and that the difference between this figure and the average of the previous years is about 114.910 units. In practice, excluding the Covid-declared deceases, there seems to be 39,019 deaths more than the average of the 2011-2019 and 10,782 period compared to the infamous 2017.
Therefore, we are in a exactly opposite situation compared to that of the initial hypothesis: the "Covid" deaths have not been inflated, indeed, it is more likely to have underestimated them, due to the impossibility of performing high numbers of swabs in the initial phases, and/or that the hospital pressure caused by the pandemic has decreased the service capacity of the health system, thus causing an increase in general mortality.
So, not only the Covid **directly** caused the death of at least 75 thousand people, but it has also **indirectly** caused the death of about 10 thousand people more than in 2017, and 40 thousand compared to the average of previous years.

Some could object by saying that it was a particularly "nefarious" year in general, not because of Covid.
To deny this possibility, we analyze the following graphs:
<img src="/images/Pillole/Analisi_dati/di_covid_o_con_covid/andamento_en.png" width="700"/> 

The first graph is related to the trend of total mortality for each month. In green we have the 2020 trend, in red that of the average of the five-year period 2015-2019, while in blue the trend of mortality associated with Covid, according to the defined criteria.
We can see how the 2020 differs from the five-year period 2015-2019 due to two peaks: the first in March/April, the second in November. In the months from May to September, instead, the two lines are almost superimposed, highlighting how the 2020 is exactly in line with the previous five-year period at that months.
From this, we can deduce how the 2020 has not been a "nefarious" year in general, but rather something happened in the two periods of "peak".
To try to understand what happened, we observe the blue line of the first graph (relative to the number of "Covid" deaths): two peaks can be noted in March/April and November, just like in the green line!
For this reason, subtracting the values of the "Covid" deaths (blue line) to those of the total deaths of 2020 (green line), we obtain the second chart. As can be noted, the trend of the deaths of 2020, net of the "Covid" deaths, is similar to that of the average of the previous 5 years. The November peak disappears almost entirely, while a remarkable peak in March remains, which confirms how much "Covid" deaths may have been partially underestimated and/or how much was the effect of the pression on the health system.
All these clues lead to concluding that people in those peak periods died FOR Covid and not with Covid; otherwise, how would you explain a major increase in total mortality in correspondence of mortality peaks related to Covid?


</div>











