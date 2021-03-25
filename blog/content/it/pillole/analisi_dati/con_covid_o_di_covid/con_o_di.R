# Library
library(tidyverse)
library(readxl)
library(ggpubr)

# importo database
tabella_decessi_provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo <- 
  read_excel("~/Downloads/tabella-decessi-provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo.xlsx", 
               sheet = "Decessi totali", na = "NA",  skip = 1)

comuni_giornaliero_31dicembre <- read.csv("~/Downloads/Dataset-decessi-comunali-giornalieri-e-tracciato-record_5marzo/comuni_giornaliero_31dicembre.csv",
                                          comment.char="#")

morticovid <- read_excel("~/Downloads/tabella-decessi-provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo.xlsx", 
                         sheet = "Decessi covid", skip = 2)

# Creo vettore per intestazione tabella decessi giornalieri
months <- rep(c("gen-feb", "mar", "apr", "mag", "giu", "lug", "ago", "set", "ott", "nov", "dec", "tot"), each = 3)
nomcol <- c("codice istat", "provincia", months)
daun <- tabella_decessi_provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo[1,]
tr <- tibble(nomcol = nomcol, daun = t(daun[1,]))
newnames <- tr %>% unite(nomcol2, c(nomcol, daun))

# cambio nomi colonna tabella decessi
provincia_mese15_20 <- tabella_decessi_provinciali_fonte_istat_decessi_provinciali_per_covid_fonte_ISS_5marzo[-1,]
colnames(provincia_mese15_20) <- t(newnames)

# ricavo numero morti totali
totmorti15_19 <- as.numeric(provincia_mese15_20$`tot_15-19`[which(provincia_mese15_20$provincia_NA == "ITALIA")])
totmorti20 <- as.numeric(provincia_mese15_20$tot_2020[which(provincia_mese15_20$provincia_NA == "ITALIA")])

# percentuale aumento
perc_aumento <- (totmorti20 - totmorti15_19)/totmorti15_19*100

# ricavo vettori dati mensili
mes15_19 <- provincia_mese15_20[which(provincia_mese15_20$provincia_NA == "ITALIA"), str_detect(colnames(provincia_mese15_20), "15-19")]
mes15_19 <- as.numeric(mes15_19[,-12])
mes20 <- provincia_mese15_20[which(provincia_mese15_20$provincia_NA == "ITALIA"), str_detect(colnames(provincia_mese15_20), "20")]
mes20 <- as.numeric(mes20[,-12])

# Divido gennaio e febbraio
mes15_19 <- c(mes15_19[1]/2, mes15_19[1]/2, mes15_19[-1])
mes20 <- c(mes20[1]/2, mes20[1]/2, mes20[-1])

# creo nuove intestazioni per poi unificare dataset
mesi <- c("gen", "feb", "mar", "apr", "mag", "giu", "lug", "ago", "set", "ott", "nov", "dec")
mesen <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
nom <- factor(mesi, levels = mesi, ordered = T)
nomen <- factor(mesen, levels = mesen, ordered = T)

# ricavo morti covid 
morticovid <-morticovid[nrow(morticovid),]
totcovid <- morticovid$`anno 2020`

# sistemo gennaio/febbraio morti covid
morticovid <- c(0, 52, as.numeric(morticovid[,-c(1:3, length(morticovid))]))

# creo tibble
mestibcov_it <- tibble(mesi = nom, "2015-2019" = mes15_19, "2020" = mes20, "Covid" = morticovid)
mestibcov_it <- mestibcov_it %>% gather(`2015-2019`, `2020`, Covid, key = "anno", value = "morti")

mestibcov_en <- tibble(mesi = nomen, "2015-2019" = mes15_19, "2020" = mes20, "Covid" = morticovid)
mestibcov_en <- mestibcov_en %>% gather(`2015-2019`, `2020`, Covid, key = "anno", value = "morti")

# plot totale morti
gtot_it <- ggplot(mestibcov_it) +
  geom_line(aes(x = mesi, y = morti, group = anno, color = anno), size = 1.2) +
  labs(title = "Numero totale dei morti") +
  theme(axis.title = element_blank()) +
  theme(legend.title = element_blank())+
  scale_y_continuous(labels = scales::comma, limits = c(0, 90000), breaks = seq(0, 85000, 20000)) +
  scale_color_manual(values=c("red1", "green3", "blue"))

gtot_en <- ggplot(mestibcov_en) +
  geom_line(aes(x = mesi, y = morti, group = anno, color = anno), size = 1.2) +
  labs(title = "Total number of deaths ") +
  theme(axis.title = element_blank()) +
  theme(legend.title = element_blank())+
  scale_y_continuous(labels = scales::comma, limits = c(0, 90000), breaks = seq(0, 85000, 20000)) +
  scale_color_manual(values=c("red1", "green3", "blue"))

# tibble senza morti covid
mortnocov20 <- select(filter(mestibcov_it, anno == "2020"), morti) - select(filter(mestibcov_it, anno == "Covid"), morti)
tibnocov_it <- mestibcov_it
tibnocov_it[which(tibnocov_it$anno == "2020"),]$morti <- as.numeric(unlist(mortnocov20))
tibnocov_it <- tibnocov_it[-c(which(tibnocov_it$anno == "Covid")),]

mortnocov20 <- select(filter(mestibcov_en, anno == "2020"), morti) - select(filter(mestibcov_en, anno == "Covid"), morti)
tibnocov_en <- mestibcov_en
tibnocov_en[which(tibnocov_en$anno == "2020"),]$morti <- as.numeric(unlist(mortnocov20))
tibnocov_en <- tibnocov_en[-c(which(tibnocov_en$anno == "Covid")),]

# plot senza covid
gnocov_it <- ggplot(tibnocov_it) +
  geom_path(aes(x = mesi, y = morti, group = anno, color = anno), size = 1.2) +
  labs(title = 'Numero morti senza Covid') +
  theme(axis.title = element_blank()) +
  theme(legend.title = element_blank()) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 90000), breaks = seq(0, 85000, 20000)) + 
  scale_color_manual(values=c("red1", "green3"))
  
gnocov_en <- ggplot(tibnocov_en) +
  geom_path(aes(x = mesi, y = morti, group = anno, color = anno), size = 1.2) +
  labs(title = 'Number of deaths without Covid') +
  theme(axis.title = element_blank()) +
  theme(legend.title = element_blank()) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 90000), breaks = seq(0, 85000, 20000)) + 
  scale_color_manual(values=c("red1", "green3"))

# Plot unione
ggarrange(gtot_it, gnocov_it, nrow = 2, common.legend = TRUE, legend = "right")

ggarrange(gtot_en, gnocov_en, nrow = 2, common.legend = TRUE, legend = "right")


# Ricavo morti tutti anni dal 2011 ad oggi
solotot <- comuni_giornaliero_31dicembre[,str_detect(colnames(comuni_giornaliero_31dicembre), pattern = "T_")]
solotot <- unlist(lapply(solotot, sum))
tot11_19 <- solotot[-10]

# creo vettori per normale
x <- seq(mean(tot11_19)- 7*sd(tot11_19), mean(tot11_19)+7*sd(tot11_19), length.out = 201)
y <- dnorm(x, mean = mean(tot11_19), sd = sd(tot11_19))

# creo tibble per linne anni
anni <- factor(rep(2011:2019, 2))
x_morti_anni <- c(tot11_19, tot11_19)
y_morti_anni <- c(rep(0, 9), dnorm(tot11_19, mean = mean(tot11_19), sd = sd(tot11_19)))
tibble_morti_anni_it <- tibble(Anno = anni, x = x_morti_anni, y = y_morti_anni)
tibble_morti_anni_en <- tibble(Year = anni, x = x_morti_anni, y = y_morti_anni)

# provo plot diverso
norm_it <- ggplot() +
  geom_line(aes(x, y)) +
  geom_line(data = tibble_morti_anni_it, aes(x = x, y = y, group = Anno, color = Anno)) +
  geom_vline(xintercept = totmorti20, color = "red", size = 1.2) +
  geom_text(aes(x = totmorti20-12000, y = max(y), label = "2020"), size = 6, color = "red") + 
  labs(caption = "fonte dati: ISTAT",
       title = "Distribuzione normale dei decessi in Italia ricostruita sulla base dei dati 2011-2019",
       x = "Decesi") +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        legend.position = "right") +
  scale_x_continuous(labels = scales::comma, breaks = c(seq(500000, 750000, length.out = 6)))

norm_en <- ggplot() +
  geom_line(aes(x, y)) +
  geom_line(data = tibble_morti_anni_en, aes(x = x, y = y, group = Year, color = Year)) +
  geom_vline(xintercept = totmorti20, color = "red", size = 1.2) +
  geom_text(aes(x = totmorti20-12000, y = max(y), label = "2020"), size = 6, color = "red") + 
  labs(caption = "data from ISTAT",
       title = "Normal distribution of deaths in Italy based on 2011-2020 data",
       x = "Deaths") +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        legend.position = "right") +
  scale_x_continuous(labels = scales::comma, breaks = c(seq(500000, 750000, length.out = 6)))





# shapiro test
shapiro.test(tot11_19)

# t-test
misure <- tot11_19
mu <- totmorti20
alpha <- 0.05

# 1. Trovo il valore della statistica test
err <- ( sd(misure) * sqrt(( length(misure) + 1) / length(misure)))
st <- (mu - mean(misure)) / err

# 2. Trovo il valore di probabilità associato (p-value) alla statistica test trovata. Funzione pt(st, gdl)
pval <- 1 - pt(st, 5)

# 3. Trovo il valore critico associato ad alpha, 1 coda perchè vedo già essere maggiore. Funzione qt(alpha, gdl)
vc <- qt(1 - alpha, 5)

# 4. Trovo valori IC
IC <- c( mean(misure) - (vc * err)  , mean(misure) + (vc * err)  )
cat(paste("t =", st), paste("p-value =", pval), paste((1-alpha)*100 , "percent confidence interval:", paste(IC, collapse = " - ")), sep = "\n")

t.test(tot11_19, mu = totmorti20)

# Probabilità tail dx
pnorm(totmorti20, mean = mean(tot11_19), sd = sd(tot11_19), lower.tail = F)


