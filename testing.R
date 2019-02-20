#download data

ShareDataURL1 = "https://drive.google.com/open?id=1uEe_Hm7GcqOOO1IKl77vzF4wXEw9JA_5" 
dataURL1 <- gsub("open\\?", "uc\\?export=download\\&", ShareDataURL1 )
dataDest1 = file.path("C:/Users/jhuang/test_data.csv" ) # please change to your local dir
download.file(dataURL1, destfile = dataDest1, method = "auto", mode = "wb")

file <- "C:/Users/jhuang/test_data.csv"  # please change to your local dir
df <- read.csv(file) 

mycol <- rgb(0, 0, 0, max = 0, alpha = 0, names = "transparent")

library(ggplot2)
library(reshape2)
library(ggmap)
us_states <- map_data("state")

#grid only 
ggplot(data = df, aes(x = Lon, y = Lat, z = SO2)) +
  geom_tile(aes(fill = SO2)) +
  ggtitle("SO2") +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_continuous(name = "SO2 (ppmv)",
                        low = "white", high = "blue") 
#add a map method 1
ggplot(data = df, aes(x = Lon, y = Lat, z = SO2)) +
  geom_tile(aes(fill = SO2)) +
  ggtitle("SO2") +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_continuous(name = "SO2 (ppmv)",
                        low = "white", high = "blue") + 
  geom_polygon(data=us_states ,aes(x=long, y=lat, group=group), colour="black", fill="red", alpha=0)

#add a map method 2
ggplot() +
  geom_polygon(data=us_states ,aes(x=long, y=lat, group=group), colour="black", fill="red", alpha=0) +
  geom_tile(data = df, aes(x = Lon, y = Lat, fill = SO2), alpha = 0.9) +
  ggtitle("SO2") +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_continuous(name = "SO2 (ppmv)",
                        low = "white", high = "blue")
 
  
