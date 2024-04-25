library(dplyr)

names(unicef_indicator2_ad)[names(unicef_indicator2_ad)=="country"]<- "region"

names(unicef_metadata_ad)[names(unicef_metadata_ad)=="country"]<- "region"

names(unicef_indicator2_ad)[names(unicef_indicator2_ad)=="time_period"]<-"year"


years <- 1980:2022

names(data_join)[names(data_join)=="gdp per capita"]<- "GDP"

names(data_join)[names(data_join)== "GDP per capita (constant 2015 US$)"]<- "GDP"

average_GDP <- aggregate(GDP ~ year, data_join, mean)

barplot(average_GDP$GDP,
        
        names.arg = average_GDP$year,
        
        col = "red",
        
        main = "Average Worldwide GDP per Capita (1980-2022)",
        
        xlab = "Timeline",
        
        ylab = "Average GDP per Capita (USD)")

