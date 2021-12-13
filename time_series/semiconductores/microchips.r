library(readr)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(readxl)
library(janitor)
library(ggthemes)
library(ggThemeAssist)
library(Cairo)
library(tidyquant)


df =  semiconductor <- read_csv("semiconductor.csv")

g1 = ggplot(df, aes(Date,Close))+ geom_line(color="#19657F", size = 1.1)+theme_safeskies + theme(plot.subtitle = element_text(size = 12,
                                        colour = "gray43"), panel.grid.major = element_line(colour = "gray88", 
                                                                                            size = 0.7),
           panel.grid.minor = element_line(linetype = "blank"),
           axis.text = element_text(size = 14, colour = "gray23"),
           plot.title = element_text(size = 20))+geom_ma(ma_fun = SMA, n = 30, color = "#a31621", size = 1.1)


g1


