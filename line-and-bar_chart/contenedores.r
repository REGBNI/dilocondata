#librarys

library(readxl)
library(ggplot2)
library(scales)

#Data
df<- read_excel("fletes.xlsx")


theme_safeskies <- theme_minimal()+ 
  theme( 
    aspect.ratio = 5/7, 
    legend.position = c(-0.08,1), 
    legend.justification = "left", 
    legend.direction = "horizontal", 
    legend.spacing = unit(c(0,0,5,-5), "line"), 
    legend.key.height = unit(0.3, "cm"), 
    legend.margin = margin(b=4, l=15, t=-1), 
    plot.margin = unit(c(0, 0, 2, 0), units="line"), 
    axis.title.y=element_blank(), 
    axis.title.x=element_blank(), 
    panel.border = element_blank(), 
    panel.grid.major.x = element_blank(), 
    panel.grid.minor.x = element_blank(), 
    panel.grid.minor.y = element_blank() 
  ) 

scaleFUN <- function(x) sprintf("%.1f", x/6.25)

g1 = ggplot(df,aes(x=date))+geom_col(aes(y=price),  fill = "#8ABFA6")+
  scale_y_continuous(

    
  # Add a second axis and specify its features
  sec.axis = sec_axis(~ .*0.25,
              labels = scaleFUN,
              breaks = seq(0,2500, by=500)),
  
  breaks  = c(seq(1000,11000,2000)
              ),
  label=comma)+
  geom_line(aes(y =growth*2500),stat = "identity", position = "identity", na.rm =TRUE, color="#19647E", size=1.5)


g1 = g1 + theme_safeskies

g1 + theme(plot.subtitle = element_text(size = 12,
    colour = "gray43"), panel.grid.major = element_line(colour = "gray88", 
                                                        size = 0.7),
    panel.grid.minor = element_line(linetype = "blank"),
    axis.text = element_text(size = 14, colour = "gray23"),
    plot.title = element_text(size = 20),
    legend.position = "top") +labs(title = "Crisis de los contenedores:",
    x = NULL, y = NULL, subtitle = "Índice global de tarifas de transporte de contenedores (Dólares)")

