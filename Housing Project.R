#Import Libraries
library(tidyverse)
library(stringr)

#Set Options
options(scipen = 999)

#Set Working Directory
setwd("/Users/niallsheppard/R Project/Housing Project")

#Read in File
data <- read_csv("PPR-ALL.csv")

#Start Tidying Data

#Split Date into Day, Month and Year columns
data <- data %>%
            separate(Date_of_Sale,c("Day","Month","Year"), sep = "/") %>%
            separate(Price_EUR,c("Currency","Price"), sep = 2) %>%
            mutate(Price = str_remove_all(Price, ",")) %>%
            mutate(Price = as.numeric(Price)) %>%
            select(-Day,-Currency, -Month) %>%
            mutate(VAT_Exclusive = as.factor(VAT_Exclusive)) %>%
            mutate(Not_Full_Market_Price = as.factor(Not_Full_Market_Price)) %>%
            mutate(Property_Size_Description = as.factor(Property_Size_Description)) %>%
            mutate(Postal_Code = as.factor(Postal_Code))

#Graph of House prices based on Time
data %>% ggplot(mapping = aes(x = Year, y = Price)) +
        geom_point()