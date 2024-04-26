library(ggplot2)
library(tidyverse)

data_join <- full_join(unicef_indicator2_ad, unicef_metadata_ad, by = "year")
colenames(data_join)
names(data_join)[names(data_join)== "country.x"] <- "region"
names(data_join)[names(data_join)== "Life expectancy at birth, total (years)"] <- "Life_Exp"

map_world <- map_data("world")

readr::spec(unicef_metadata_ad)
readr::spec(unicef_indicator2_ad)

names(unicef_metadata_ad)[names(unicef_metadata_ad)== "country"] <- "region"
names(unicef_indicator2_ad)[names(unicef_indicator2_ad)== "country"] <- "region"

#Data Merge (Country)
merge_data <- merge(unicef_metadata_ad, unicef_indicator2_ad, by = "region", all = TRUE)

data_join_2020 <- unicef_metadata_ad%>%
  filter(year == 2020)
names(data_join_2020)[names(data_join_2020)== "Life expectancy at birth, total (years)"] <- "Life_Exp"

world_map <- map_data("world")

#Map of life Exp 2020

map_data_join <- full_join(data_join_2020, world_map, by = c("region"))

ggplot(map_data_join) +
  aes(x = long, y = lat, group = group, fill = Life_Exp) +
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "orange", na.value = "grey") +
  labs(title = "Worldwide Life Expectancy in 2020")
