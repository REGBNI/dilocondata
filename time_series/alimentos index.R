library(readxl)
library(ggplot2)
library(dplyr)
library(tidyverse)



df <- read_excel("external-dataseptember.xls", 
                                     sheet = "data")

df$date =  as.Date(df$date)

df1 =  select(df, c("date","all_index","food_index"))


g1 = ggplot(df1, aes(date))+
  geom_line(aes(y = food_index), size = 1.1,  color=c("#1d4e89"))+
  geom_line(aes(y =  all_index), size = 1.1, color = c("#00a896") )+ 
  theme_safeskies + theme(plot.subtitle = element_text(size = 12,
colour = "gray43"), panel.grid.major = element_line(colour = "gray88", 
size = 0.7),
panel.grid.minor = element_line(linetype = "blank"),
axis.text = element_text(size = 14, colour = "gray23"),
plot.title = element_text(size = 20))


g1 = g1+ scale_x_date( limits = c(as.Date("2008-01-01"),as.Date("2021-08-01")),
                  breaks = 
                    c(as.Date("2008-06-01"), as.Date("2010-08-01"),
                      as.Date("2012-08-01"),as.Date("2014-08-01"),
                      as.Date("2016-08-01"), as.Date("2018-08-01"),
                      as.Date("2020-08-01"),as.Date("2021-08-01"))
                  ,
                  date_labels = " %Y") 
g1 + theme(axis.line = element_line(colour = "gray43",
    size = 0.3, linetype = "solid"))



df2 = select(df, -c("all_index","food_index"))
df2 = df2[164,]
df2 = gather(df2, "date", "valor",2:9)
df2$date = as.factor(df2$date)

ggplot(df2,aes(valor,date))+
  geom_segment( aes(y=date, yend=date, x=0, xend=valor), color="#00a896", size = 8)+
  theme_light() +
  theme( aspect.ratio = 5/7,
         plot.margin = unit(c(0, 0, 0, 0), units="line"),
         panel.grid.major.y = element_blank(),
         panel.border = element_blank(),
         axis.ticks.y = element_blank()
  )+theme(axis.ticks = element_line(colour = "gray64"),
          axis.text = element_text(size = 16, colour = "gray20"),
          axis.text.x = element_text(colour = "gray20",
                                     angle = 0)) +labs(x = NULL, y = NULL)





















