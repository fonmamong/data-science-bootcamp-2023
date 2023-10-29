---
title: "HW_dataviz_evcars"
author: "Suthumma M"
date: "2023-10-22"
output:
  pdf_document: default
  html_document: default
  word_document: default
---
[Source.] (https://www.kaggle.com/datasets/willianoliveiragibin/electric-vehicle-population/)

```{r echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE}

library(dplyr)
library(tidyverse)

#import data from csv file 
EV_cars <-read.csv("Electric_Vehicle_Population_Data.csv", stringsAsFactors = FALSE)

## BEV, PHEV 
Type <-EV_cars  %>%  
  group_by(Make)%>% 
  count(Electric.Vehicle.Type) %>% 
  arrange(-n) %>% 
  head(10)

 ## change col name 
Type <- Type%>% 
  rename(cars = n,
         type_make= Make,
         ev_type =Electric.Vehicle.Type)

#graph for type EV car
ggplot(Type, aes(cars,type_make,fill=ev_type))+
  geom_col()+
  theme_minimal()+
    labs(
    title = "1.Top 10 EV car brand by BEV and PHEV type ", 
    subtitle = "people choose BEV (100% EV) more than PHEV (combine ICE and EV )",
    x = "Cars",
    y = "Brand", 
    caption = ""
  )

```


```{r echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE}

ggplot(EV_cars %>% 
         filter(Model.Year > 2023) %>%
         count(Make,Model,Electric.Vehicle.Type),  aes(n,Make, fill =Electric.Vehicle.Type))+
  geom_col()+
  theme_minimal()+
  labs(
    title = "2.Model 2024 by BEV and PHEV type ", 
    subtitle = "",
    x = "Cars",
    y = "Brand", 
    caption = ""
  )

```

    "Although EV cars BEV popular than PHEV but the 2024 model some brands still choose PHEV such as BMW,MAZDA"

```{r echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE}

EV_state <- EV_cars %>%   
  group_by(State)%>% 
  count(State)%>% 
  arrange(-n) 

Top_state <- EV_state %>% head(1)

other_state<-EV_state %>% 
  filter ( State !="WA")

sum_state <-data.frame(id = 1:2,
    state = c(Top_state$State, "Otherstate"),
    cars = c(Top_state$n,sum(other_state$n)))
ggplot(sum_state,aes(state,cars,fill= cars))+
  geom_col()+
  theme_minimal()+
   labs(
    title = "3.State of Washington have EV cars 98% ", 
    subtitle = "",
    x = "State",
    y = "cars", 
    caption = ""
  )

```

  
    "State of Washington have EV Cars about 98 % (150,141 cars)"
    
    
```{r echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE}

wa <-EV_cars %>% 
  filter ( State == "WA")

ggplot (
          wa %>% 
          group_by(County)%>%
          count(Make) %>% 
          arrange(-n)%>% 
          head(10), 
  aes(n,County,fill= Make)) +
  geom_col()+
  labs(
    title = "4.Distribution of EV cars in state of WA  ", 
    subtitle = "",
    x = "Cars",
    y = "State", 
    caption = ""
  )

```
    
    "Tesla has distribution other countries such as Clark, Snohomish , most popular at the King County"


```{r echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE}

ggplot(EV_cars %>% 
         filter (Make == "TESLA") %>% 
         group_by (State,Model.Year) %>%
         count(State)%>% 
         arrange(-n) %>% 
         head(5), aes(Model.Year,n,fill = Model.Year))+
  geom_point()+
  geom_smooth ()+
  theme_minimal()+
  geom_text(aes(label = n),hjust = 1.5, size = 2.6)+
    labs(
    title = "5.Growth of Tesla user on 2018-2023", 
    subtitle = "",
    x = "Model year",
    y = "Cars", 
    caption = ""
  )
```

    "Growth of tesla user 2023 = 253 % from 2020"

```{r echo=FALSE}
options(tinytex.verbose = TRUE)
library(tinytex)
```


