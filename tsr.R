library(tidyverse)

taylor_swift <- read.csv("/Users/Caro/Desktop/Taylor Swift Spotify Data 07-23.csv")


#Explore the data
glimpse(taylor_swift)
dim(taylor_swift) # Look at the number of rows and columns - 476 rows, 36 columns
names(taylor_swift) #Getting 36 variable names
length(taylor_swift)

#dropping unnecessary columns. To drop unecessary columns, we will code
#the variables I want to keep in my analysis. 
taylor_swift <- subset(taylor_swift, select= c(
                                               album_release_date,
                                               album_release_year,
                                               danceability, energy,
                                               key,loudness,speechiness,
                                               acousticness, instrumentalness,
                                               valence, tempo,
                                               duration_ms, explicit,
                                                track_name,track_number, album_name, 
                                               key_name, mode_name))
            
                                                                               
attach(taylor_swift) #To get rid of $ when picking variables)

#Reordering the variables in Taylor Swift. I want to rename
#my new cleaned data frame called ts_clean. 
ts_clean <-taylor_swift %>%
  select(track_name, track_number, album_name, everything())

attach(ts_clean)

#This code shows the number of tracks in each album. For example,
#the album 1989 has 13 tracks. We order in DESCENDING order.
ts_album <- sort(table(album_name),decreasing = TRUE) %>% 
  view()


#Start filtering data. Let's Analyze TS' Explicit Songs. She has 54 Explicit Songs and 422 non explicit songs
ts_clean %>% 
  select(track_name, album_name, album_release_year, explicit) %>% 
  filter(explicit=="TRUE") %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, album_release_year, explicit) %>% 
  filter(explicit=="FALSE") %>% 
  view()

#Let's filter the data more. We want to display the danceability and energy
#in descending order. We will look into it one by one and write the results here:
#'I think He Knows' from 'Lover' has the highest danceability of 0.897.
#'Haunted'  from 'Reputation Tour Surprise' has the highest energy of 0.949
#'Haunted' from 'Speak Now' has the highest Loudness of -1.909
ts_clean %>% 
  select(track_name, album_name, danceability, energy, loudness) %>% 
  arrange(desc(danceability)) %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, danceability, energy, loudness) %>% 
  arrange(desc(energy)) %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, danceability, energy, loudness) %>% 
  arrange(desc(loudness)) %>% 
  view()

#We will filter the data again. We will display the following variables into descending order as well.
#We will look into it one by one and write the results here:
#'I wish You Would' from '1989' has the highest speechiness of 0.9120
#'It's nice to have a friend' from 'Lover' has the highest accousticness of 0.971
#'Labyrinth from Midnight has the highest instrumentalness of 0.488000
#'Shake it off' from 1989 has the highest valence of 0.943
#'State of Grace' from Red has the highest tempo of 208.918
ts_clean %>% 
  select(track_name, album_name, speechiness, acousticness, instrumentalness, valence, tempo) %>%
  arrange(desc(speechiness)) %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, speechiness, acousticness, instrumentalness, valence, tempo) %>%
  arrange(desc(acousticness)) %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, speechiness, acousticness, instrumentalness, valence, tempo) %>%
  arrange(desc(instrumentalness)) %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, speechiness, acousticness, instrumentalness, valence, tempo) %>%
  arrange(desc(valence)) %>% 
  view()

ts_clean %>% 
  select(track_name, album_name, speechiness, acousticness, instrumentalness, valence, tempo) %>%
  arrange(desc(tempo)) %>% 
  view()

#We will use Group by for trial. We will use danceability, energy and loudness
#Result: Lover is the album with mean of  high danceability :0.658, Speak Now is the lowest :0.44
#1989 is the album with the highest energy: 0.698, folkore with the lowest 0.373
#Speak Now is the Album with the highest loudness : -4.600, midnight with the lowest -10.88
ts_groupby <-ts_clean %>% 
  group_by(album_name) %>% 
  summarise(mean(danceability), mean(energy), mean(loudness)) %>% 
  arrange(desc(mean(danceability))) %>% 
  view()

#We will use the same group by method with the following variables:
#Result:
#1989 highest speechiness 0.173, fearless lowest speechiness: 0.031
#Evermore highest accousticness 0.795, 1989 lowest accousticness 0.1131
#Midnight has highest instrumentalness 3.77, Live from clear has the least instrumentalness :0.00
#Live from clear has the highest tempo 137.64, Red has the least tempo 110.29
#MLover has the highest valence 0.48, Midnight has the lowest valence 0.223
ts_groupby <-ts_clean %>% 
  group_by(album_name) %>% 
  summarise(mean(speechiness), mean(acousticness), mean(instrumentalness), mean(tempo), mean(valence)) %>% 
  view()

#We will use the summary to get an overall view.

ts_clean %>% 
  select(danceability, energy, loudness, speechiness,
         acousticness, instrumentalness, tempo, valence) %>% 
  summary


#Convert the millisecond to minutes and renaming the column
#from duration_ms = duration_minutes. we will make it a new dataframe

ts_cleans <- ts_clean %>% 
  mutate(duration_ms= duration_ms/60000)%>%
  rename(duration_minutes=duration_ms) %>% 
  view

#Grouping by album_name and look at the mean of duration minutes

ts_cleans %>% 
  group_by(album_name) %>% 
  summarise(mean(duration_minutes)) %>% 
  view

#Making visualizations for this analysis
#Import ggplot2 to make visualization.
library(ggplot2)

#Scatter plot: TS Song Explicit & Non Explicit Songs throughout the years (Sorted by Minutes)
ts_cleans %>% 
  ggplot(aes(x=album_release_year, y=duration_minutes))+
  geom_point(aes(colour=explicit))+
  geom_smooth(method=lm, se=F)+
  labs(x="Release Year",Y="Minutes", title="TS Explicit/Non Explicit Album Release Date VS Minutes")+
  theme_minimal()

#Bar Graph: TS Songs Quantity Per Album
ts_cleans %>% 
  ggplot(aes(fct_infreq(album_name)))+
  geom_bar(fill="Pink")+
  coord_flip()+
  theme_bw()+
  labs(x=album_name, y=NULL,
       title= "Taylor Swift Albums Songs Quantity")
  
#Histogram: Acoustincess of TS Songs 
ts_cleans %>% 
  ggplot(aes(x=acousticness))+
  geom_histogram(binwidth = 0.1, fill="Pink")+
  theme_bw()+
  labs(x="acousticness", y=NULL, title="Accousticness of Taylor Swift")

#Scatter Plot: Speechiness vs Instrumentalness of TS songs
ts_cleans %>% 
  ggplot(aes(x=speechiness, y=instrumentalness))+
  geom_point(colour='Gold')+
  geom_smooth()+
  facet_wrap(~album_release_year)+
  theme_bw()+
  labs(Title="Speechiness & Instrumentalness")

#Scatter Plot for Danceability & Energy of TS Songs
ts_cleans %>% 
filter(energy >=0) %>% 
  ggplot(aes(x=energy, y=danceability, colour=mode_name))+
  geom_point(size=3, colour='Light Blue')+
  geom_smooth(alpha=0.3)+
  theme_minimal()+
  labs(Title="Danceability and Energy")

#Tempo of TS Songs
ts_cleans %>% 
  ggplot(aes(x=album_release_year, y=tempo))+
  geom_boxplot()+
  theme_bw()

#Line Density Chart for Valence
ts_cleans %>% 
  ggplot(aes(valence,fill = explicit))+
  geom_density(alpha=0.2)+
  theme_bw()

#Histogram for Tempo of Taylor Swift's songs
ts_cleans %>% 
  ggplot(aes(x=tempo))+
  geom_histogram(binwidth = 4, fill="Orange")+
  theme_bw()+
  labs(x="Tempo",y="count",title="Tempo of Taylor Swift Songs")


