install.packages("plotly")
library(plotly)
names(data_join)[names(data_join) =="country"] <- "region"
names(data_join)[names(data_join) =="Life expectancy at birth, total (years)"] <- "Life_Exp"

#Time Series 1

timeseries_plot_1 <- data_join %>%
  ggplot() +
  aes(year, Life_Exp, group = region.x, color = region.x) +
  geom_line() +
  labs(title = "Life Expectancy Through The Years") +
  theme_classic()

ggplotly(timeseries_plot_1)
    
    