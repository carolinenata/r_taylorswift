# Taylor Swift Music Style Analysis: R Programming

## Background

This is a personal project made to challenge and showcase my R programming skills. This project focuses more on her music style than her album sales. The data is taken from Taylor Swift's Spotify Data in Kaggle. 

**Objective:** To give insight to Taylor Swift fans so they can observe the trends and growth of Taylor Swift's music evolution throughout the years. This project is also catered to Indie or aspiring musicians who is seeking for inspiration to compose music. 

Tools: R Programming for analysis and visualization

## Ask
Before I start the analysis, these are the following questions I ask myself: (Taylor Swift will be abbreviated as TS for this document)

1. How many of TS's songs are explicit/non explicit?

2. How has Taylor Swift's music changed over the years?

3. What is the average duration of TS' album and how many songs are there in total?

## Prepare

To do my analysis, I obtained my dataset from Kaggle. This quality dataset was last updated on 3 March 2023.

## Process
I imported the CSV data to R Programming.  They have 36 variables. I decided to get rid of the once that are repetitive and not relevant to the analysis by coding it in R Programming. Eventually the variables I keep are:

* track_name

* track_number

* album_name

* album_release_date

* album_release_year

* danceability

* energy

* key

* loudness

* speechiness

* acousticness

* instrumentalness

* valence

* tempo

* duration_ms

* explicit

* key_name

* mode_name

## Analyze

View my R programming code [here](https://github.com/carolinenata/r_taylorswift/blob/main/tsr.R)


Here are some notable analysis I discover:

* 'Reputation Stadium Tour Surprise Song Playlist' has 46 songs in her album. It has the most songs in her album.

* TS has 422 Non Explicit Songs and 54 explicit songs.

* 'Lover' is the album with the highest mean danceability (0.658) while 'Speak Now World Tour Live' has the least (0.441). 

* '1989' is the album with the highest mean energy (0.698) while 'Folkore: The Long Pond Studio Sessions' has the least (0.373).

* 'Speak Now - Taylor's Version' is the album with the highest loudness (-4.600) and 'Midnights' has the least (-10.88).

* 'Speak Now - Tour Live' has the highest overall mean minutes (4.9) while Midnights has the least (3.395).

* '1989 (Deluxe)' has the highest speechiness(0.173) while 'Fearless - Platinum Edition' has the least (0.031).

* 'Evermore' has the highest acousticness (0.795) while 1989 has the least acousticness(0.1131).

* 'Midnight' has the highest instrumentalness (3.77) while 'Live From Clear Channel Stripped 2008' has the least instrumentalness (0.00) 


## Share

**Taylor Swift Songs Album Quantity**

<img width="641" alt="album song quantity" src="https://github.com/carolinenata/r_taylorswift/assets/138493962/69c7a22c-6903-4427-bd11-5f71ada16ba9">

From this bar graph, we learn that 'Reputation' Stadium Tour has the highest amount of songs in the album. (46) while 'Live From Clear Channel Stripped 2008' has the least songs (8).

**Taylor Swift Explicit/Non Explicit Songs sort by Minutes and Year**

<img width="572" alt="explicit non explicit" src="https://github.com/carolinenata/r_taylorswift/assets/138493962/3a01c35e-9777-4fa3-8b9d-b3cd4b84008a">

From this chart,  we learn that a majority of TS' songs are around 3-6 minutes. Most of her songs are not explicit until 2020.  The outlier of this graph is one explicit song that is around 10 minutes.  That song is 'All Too Well' from 'Red (Taylor's Version)'

**Taylor Swift Music Speechiness vs Instrumentalness**

<img width="439" alt="speechiness and instrumentalness" src="https://github.com/carolinenata/r_taylorswift/assets/138493962/6f075d6a-44f4-49ec-a917-05b20f2ab64e">

From this chart, we learn that Non Explicit Songs has higher instrumentalness and speechiness than explicit songs. There is one explicit song that has a high instrumentalness as an outlier. That song is 'Gold Rush' from 'Evermore (deluxe version)'. (Note: Explicit songs are labelled as TRUE while non Explicit songs are labelled as FALSE)

**Taylor Swift Music Danceability and Energy based on Mode keys**

<img width="440" alt="energy danceability" src="https://github.com/carolinenata/r_taylorswift/assets/138493962/a892d52f-b21f-4383-a231-495f893153db">

From this scatter plot, we learn that songs with minor keys  has slightly higher danceability and energy than songs using major key. These are some of the song discoveries from this:

* Song with the highest danceability (major key): I Think He Knows from Lover

* Songs with the highest danceability (minor key): Vigilante Shit from Midnights

* Song with the highest energy (major key): Haunted from Reputation Stadium Tour Surprise Song Playlist

**Tempo of Taylor Swift Songs**

<img width="436" alt="tempo" src="https://github.com/carolinenata/r_taylorswift/assets/138493962/0ceaa877-6b20-44c7-b252-cd928bc799dd">

From this histogram, we learn that most of Taylor's songs have less than 100 - 120 tempo. The outlier of this chart is a few of the songs that are around 200 tempo. 

**Valence of Taylor Swift Songs**

<img width="385" alt="valence" src="https://github.com/carolinenata/r_taylorswift/assets/138493962/dbebf2ca-6de8-4a7f-9173-ef669075883b">

Valence is the joy and positivity a song brings. From this density chart, explicit songs have higher valence than non explicit ones. 


## Act

**How can I use my findings to help people?**

I think my findings will be useful for aspiring musicians and  Swifties (a term for Taylor Swift fan) who want to get in touch with Taylor's music styles. Taylor Swift is one of the biggest music artists in the world and her presence might be inspiring for indie or aspiring musicians who want to be just like her. 

* Example: if a musician want to compose songs with high energy, they can decide whether they want to compose songs in minor or major key by looking into my scatter chart above. They can also gain more insights how Taylor's music change over the years like how since 2020, her songs are more explicit. They can also learn that her explicit songs are more happier than non explicit songs. 

Lastly, we can also know which one of her songs have the longest duration and which one of her album has the highest amount of songs. By knowing which song has the most what, aspiring musicians can easily select one Taylor Swift track they can get inspiration from before they write the music. For example, if they want to compose a song with more instrumental music, they can listen to 'Gold Rush' from Evermore album.
