#librerias

library(ggplot2)
library(readxl)
library(dplyr)
library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)



#Datos a utilizar

df <-  read_excel("china_investment.xlsx")
df <- df %>%  select(Year,`Quantity in Millions`,Country,Sector)

df1 <- df %>% group_by(Year) %>% summarise(total = sum(`Quantity in Millions`))
df2 <- df %>%  group_by(Sector, Country) %>% summarise(total = sum(`Quantity in Millions`))
df3 <- df %>%  group_by(Country) %>% summarise(total = sum(`Quantity in Millions`))

#Esto lo hacemos para poder hacer join con la base de datos world
colnames(df3 )= c("name_long","Inversión")

#Chartnmap

theme_set(theme_bw()) #tema a usar
world <- ne_countries(scale = "medium", returnclass = "sf")
world_inves = right_join(world, df3, by = "name_long")


#Creación del gráfico
ggplot(data = world_inves) +
  geom_sf() +
  coord_sf(xlim = c(-102.15, -74.12), ylim = c(7.65, 33.97), expand = FALSE)+geom_sf(aes(fill = Inversión))+ 
  scale_color_gradient2( low = "#FFF1E8", mid = "#FFE2CF",  high = "#B3937F", space = "Lab",aesthetics = "fill" )
