library(tidyverse)
library(ggplot2)

## Stessa SD
x <- seq(-5, 5, 0.01)
y <- dnorm(x, mean = 0, sd = 1)
y2 <- dnorm(x, mean = 1, sd = 1)
y3 <- dnorm(x, mean = -1.5, sd = 1)

df.mean <- data.frame(x, y, y2, y3) %>%
  gather("y", "y2", "y3", key = "dist", value = "y")
  

ggplot(df.mean) +
  geom_line(aes(x, y, color = dist)) +
  scale_color_manual(labels = c("0", "1", "-1.5"), values = c("blue", "red", "green3")) +
  scale_y_continuous(name = NULL, labels = NULL, breaks = NULL) +
  labs(color = "Mean", title = "Normal distributions with different means and fixed SD = 1") +
  scale_x_continuous(minor_breaks = NULL, name = NULL) +
  theme_minimal(base_line_size = .2)

## Stessa media
x <- seq(-5, 5, 0.01)
y <- dnorm(x, mean = 0, sd = 1)
y2 <- dnorm(x, mean = 0, sd = 2)
y3 <- dnorm(x, mean = 0, sd = 3.5)

df.mean <- data.frame(x, y, y2, y3) %>%
  gather("y", "y2", "y3", key = "dist", value = "y")


ggplot(df.mean) +
  geom_line(aes(x, y, color = dist)) +
  scale_color_manual(labels = c("1", "2", "3.5"), values = c("blue", "red", "green3")) +
  scale_y_continuous(name = NULL, labels = NULL, breaks = NULL) +
  labs(color = "SD", title = "Normal distributions with different SD and fixed mean = 0") +
  scale_x_continuous(minor_breaks = NULL, name = NULL) +
  theme_minimal(base_line_size = .2)

## Tutto variabile
x <- seq(-5, 5, 0.01)
y <- dnorm(x, mean = 0, sd = 1)
y2 <- dnorm(x, mean = 1, sd = 2)
y3 <- dnorm(x, mean = -0.5, sd = 0.8)

df.mean <- data.frame(x, y, y2, y3) %>%
  gather("y", "y2", "y3", key = "dist", value = "y")


ggplot(df.mean) +
  geom_line(aes(x, y, color = dist)) +
  scale_color_manual(labels = c("0; 1", "1; 2", "-0.5; 0.8"), values = c("blue", "red", "green3")) +
  scale_y_continuous(name = NULL, labels = NULL, breaks = NULL) +
  labs(color = "Mean; SD", title = "Normal distributions with different means and SD") +
  scale_x_continuous(minor_breaks = NULL, name = NULL) +
  theme_minimal(base_line_size = .2)


## Intervalli e code
x <- seq(-5, 5, 0.01)
y <- dnorm(x, mean = 0, sd = 1)

xleft <- seq(-5, -1, 0.01)
xrange <- seq(0.8, 1.3, 0.01)
xright <- seq(2, 5, 0.01)


color <- rbind(
  data.frame(x = xleft, color = "1"),
  data.frame(x = xrange, color = "2"),
  data.frame(x = xright, color = "3")
) %>%
  mutate(y = dnorm(x, mean = 0, sd = 1))

ggplot() +
  geom_line(aes(x, y)) +
  geom_area(data = color, aes(x, y, fill = color, color = color), alpha = 0.7)+
  scale_fill_manual(labels = c("Left tail", "Range", "Right tail"), values = c("red", "blue", "green3")) +
  scale_color_manual(labels = c("Left tail", "Range", "Right tail"), values = c("red", "blue", "green3")) +
  labs(fill = "Legend", color = "Legend") +
  scale_y_continuous(name = NULL, labels = NULL, breaks = NULL) +
  scale_x_continuous(minor_breaks = NULL, name = NULL, breaks = c(-5, -1, 0, 0.8, 1.3, 2, 5)) +
  theme_minimal(base_line_size = .2) 
  theme(legend.key.size = unit(.5, 'cm'), #change legend key size
                                      legend.key.height = unit(1, 'cm'), #change legend key height
                                      legend.key.width = unit(1, 'cm'), #change legend key width
                                      legend.title = element_text(size=12, face = "bold"), #change legend title font size
                                      legend.text = element_text(size= 12), axis.text.x = element_text(size = 14)) #change legend text font size)
  
  
  
x <- seq(-5, 5, 0.01)
y <- dnorm(x, mean = 0, sd = 1)
ggplot() +
  geom_line(aes(x, y), color = "white", size = 2) + 
  theme( panel.background = element_rect(fill = "#E82B2B")) +
  scale_y_continuous(name = NULL, labels = NULL, breaks = NULL) +
  scale_x_continuous(minor_breaks = NULL, name = NULL, breaks = NULL)
  
  
  

