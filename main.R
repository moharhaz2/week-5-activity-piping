#Lines 5 through 20 are examples of various file types 
#and the code to read and write them. 
#Your tasks begin at line 22.

#Getting and saving your dataset is typically a two step process
#Read and write a delimited text file.
#datasetname <- read.table(âfile.txtâ)
#write.table(datasetname, âfile.txtâ)

#Read and write a comma separated value file. This is a special case of read.table/ write.table.	
#datasetname <- read.csv(âfile.csvâ)
#write.csv(datasetname, âfile.csvâ)

#Read and write an R data file, a file type special for R.	
#load(âfile.RDataâ)
#save(datasetname, file = âfile.Rdataâ)

#Read and write an R data file from GitHub.
#You need to select 'raw data' on the GitHub page 
#and then copy the URL and put in your code, as below

#TASK: run the code below to get and save the dataset
download.file(url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", destfile = "airline_safety.csv")
#Then you need to name your dataset
airlineSafety_data_look<- read.csv("airline_safety.csv")

#TASK: take a look at the airline safety data. 
airlineSafety_data_look

#TASK: Install and call the dplyr package. 
install.packages("dplyr")
library(dplyr)


#Let's make a random sample of our data and save it
mysample1<-sample_n(airlineSafety_data, size=15, replace = FALSE, weight = NULL, .env = NULL)

#TASK: Save the new sample as a csv file
write.csv(mysample1,"mysample.csv")


#Now let's have some fun with *piping*

#we will use our mysample dataset
#The pipe, %>%, comes from the magrittr package. 
#Packages in the tidyverse (like dplyr) load %>% for you automatically, 
#so you donât usually load magrittr explicitly.


#Example: Let's try some piping with our mysample data. Note how the dataset name is not repeated in each function
piping<-mysample1 %>% 
  mutate (seats = avail_seat_km_per_week) %>%
  subset(incidents_85_99 < 24) %>%
  dim()%>%
  print()

#TASK: revise this code chunk using piping
mysample2<-mysample1
arrange(mysample2, airline)
mysample2<-filter(mysample2, incidents_85_99<25)
mysample2<-rename(mysample2, seats = avail_seat_km_per_week)
mysample3<-select(mysample2, incidents_00_14, incidents_85_99)
mysample4<-summary(mysample3)
dim(mysample4)
print(mysample4)

# the soltion solution
piping <- mysample1 %>%
  filter (incidents_85_99<25)%>%
  rename (seats = avail_seat_km_per_week) %>%
  select(incidents_00_14, incidents_85_99)%>%
  summary()%>%
  print()

