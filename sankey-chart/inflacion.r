

library(readxl)
library(plotly)
library(ggplot2)
library(networkD3)
library(tidyverse)
library(dplyr)



df2 <- read_excel("inflacion/df.xls", sheet = "sankey")



#Prepare the data
name_vec <- c(unique(df2$origen), unique(df2$destino))
nodes <- data.frame(name = name_vec, id = 0:13)

links <- df2 %>%
  left_join(nodes, by = c('origen' = 'name')) %>%
  rename(origin_id = id) %>%
  left_join(nodes, by = c('destino' = 'name')) %>%
  rename(dest_id = id)

# Add a 'group' column to each connection:
links$group <- as.factor(c("type_a","type_a","type_a","type_a","type_a","type_a",
                           "type_a","type_a","type_a","type_a","type_a","type_a",
                           "type_b","type_b","type_b","type_b","type_b","type_b",
                           "type_b","type_b","type_b","type_b","type_b","type_b"))

# Add a 'group' column to each node
nodes$group <- as.factor(c("my_unique_group"))

# Give a color for each group:
my_color <- 'd3.scaleOrdinal() .domain(["type_a", "type_b", "my_unique_group"]) .range(["#f2e5d7", "#ffd6ba", "#032b43"])'


chart = sankeyNetwork(Links = links, Nodes = nodes, Source = 'origin_id', Target = 'dest_id', 
              Value = 'valor', NodeID = 'name', fontSize = 20,nodeWidth = 25,
              colourScale=my_color, LinkGroup="group", NodeGroup="group")

