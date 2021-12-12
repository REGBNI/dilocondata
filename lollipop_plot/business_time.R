#librarys

library(readxl)
library(tidyverse)
library(ggplot2)
library(ggthemes)

df <- read_excel("API_IC.REG.DURS_DS2_en_excel_v2_3012072.xls", 
                                                      sheet = "Data")

df = gather(df, "year", "valor", 3:20)
df <- df[!is.na(df$valor),]

paises = c("Venezuela", "Argentina", "Colombia",
           "Mexico","Costa Rica","Honduras","Panama","Guatemala","El Salvador","Chile",
            "Nicaragua", "Brazil","United States",
           "Norway", "Germany", "Japan","Sweden","China")

region = c("Latin America & Caribbean")


df <- filter(df, `Country Name` %in% region)

df$`Country Name` = factor(df$`Country Name`, levels= c("Venezuela", "Argentina", 
                                                        "Colombia",
                                                        "Mexico","Costa Rica","Honduras","Panama","Guatemala","El Salvador","Chile",
                                     "Nicaragua", "Brazil","United States", "Norway","Germany", "Japan","Sweden","China"),
                             
                             
                             labels = c("Venezuela", "Argentina", "Colombia", 
                                        "Mexico","Costa Rica","Honduras","Panama","Guatemala","El Salvador","Chile",
                                        "Nicaragua", "Brasil",
                                     "Estados Unidos", 
                                      "Noruega","Alemania", "Japón","Suecia","China"))

df <- filter(df, year== c(2019))






g1 = ggplot(df,aes(valor,`Country Name`))+
  geom_segment( aes(y=`Country Name`, yend=`Country Name`, x=0, xend=valor), color="#19657F") +
  geom_point( color="#19657F", size=5, alpha=0.7) +
  theme_light() +
  coord_flip() +
  theme( aspect.ratio = 5/7,
  plot.margin = unit(c(0, 0, 0, 0), units="line"),
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank()
  )




g1 = g1 + theme(axis.ticks = element_line(colour = "gray64"),
    axis.text = element_text(size = 12, colour = "gray23"),
    axis.text.x = element_text(colour = "gray23",
        angle = 25)) +labs(x = NULL, y = NULL)
