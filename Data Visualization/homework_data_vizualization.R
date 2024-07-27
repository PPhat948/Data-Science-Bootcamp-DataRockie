library(tidyverse)
#prepare data 
set.seed(40)
sample_diamonds = diamonds %>%
  sample_frac(0.1)

#1.Visualize relationship of price and carat
sample_diamonds %>%
  ggplot(aes(x=carat,y = price)) + 
  geom_point(alpha=0.7) +
  geom_smooth(col = 'red') +
  geom_rug() +
  theme_minimal() +
  labs(title = 'Relationship of price and carat',
       x = 'Diamond Carat',
       y = 'Price in USD$')

#2.Visualize relationship of price and clarity
sample_diamonds %>%
  ggplot(aes(x=clarity,y=price,fill = clarity)) + 
  geom_col() +
  theme_minimal() +
  labs(title = 'Relationship of price and clarity',
       x = 'Clarity',
       y = 'Price in USD')

#3.Visualize histogram of carat when cut in premium
filter_diamonds = sample_diamonds %>% 
  filter(cut == 'Premium') 

filter_diamonds %>%
  ggplot(aes(price)) +
  geom_histogram(binwidth = 1000, color = 'black',fill = 'blue',alpha = 0.7) +
  theme_minimal() +
  labs(title = 'Histogram of diamonds price when cut in premium')

#4.visualize color and cut by using bar charts
  sample_diamonds %>%
  ggplot(aes(color,fill = cut)) +
  geom_bar(position = 'dodge') +
  theme_minimal() +
  labs(title = 'Bar chart of color and cut of diamonds')
  
#5.visualize relation of carat and price split it by cut
  sample_diamonds %>%
    ggplot(aes(x=carat,y=price)) +
    geom_point(alpha = 0.6,size = 1.5)+
    geom_smooth(method = 'lm',col = 'red') +
    facet_wrap(~cut,ncol = 3) +
    theme_minimal() +
    labs(title = 'Relationship of carat and price',
         subtitle = 'Split by quality of cut',
         x = 'Diamond Carat',
         y = 'Price in USD$')
  
  
