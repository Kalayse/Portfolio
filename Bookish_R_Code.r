install.packages("tidyverse")
library(tidyverse)

library(readr)
PTile_CountsRatings <- read_csv("Dataframe Fun/Bookish Portfolio/PTile_CountsRatings.csv")
View(PTile_CountsRatings)

ggplot(data = PTile_CountsRatings)+
  geom_point(mapping=aes(x=Rating, y=CountsOfReview))
#standard geom_point of Rating compared to Counts of Reviews.

install.pacakages("quantreg")
library(quantreg)
#installing package for geom_quantile

PTile_CountsRatings %>% 
  ggplot(mapping=aes(x=Rating, y=CountsOfReview))+
  geom_jitter()+
  geom_quantile()

 WithCostAZGR <- read_csv("Dataframe Fun/Bookish Portfolio/WithCostAZGR.csv")
 View(WithCostAZGR)
#uploading and making available data frame with inner joined Amazon and Goodreads' dataset with manually
 #added genre and current cost of each book. There are 22 distinct values per SQL query.
 
Bar_AZGR <- WithCostAZGR %>% 
  ggplot(mapping=aes(x=AmazonRating, fill=Genre))+
  geom_bar()

Bar_AZGR + 
  labs(title = "Sample Size: Amazon Book Breakdown", subtitle ="Comparing the Count, Genre, and Average Rating")+
  labs(x= "Average Rating", y= "Sample Count of Rating")+
  labs(caption= "Visualization is a sample size of data from Top 50 Best Selling from 2009-2019")
#lines 26-34, generating visualization and adding labels. Viz saved. Genre breakdown is more specific than 
#original dataset(Amazon2009_2019Books.csv) the same is from.

Amazon2009_2019Books <- read_csv("Dataframe Fun/Bookish Portfolio/Amazon2009_2019Books.csv")
View(Amazon2009_2019Books)
#uploading raw data, sample data used for Bar_AZGR is from the Amazon2009_2019Books dataset. Genre breakdown is
#only fiction v. nonfiction.

colnames(Amazon2009_2019Books)

Amazon2009_2019Books.1 <- rename(Amazon2009_2019Books, BookTitle=Name, Rating=UserRating, BestYear=Year)
View(Amazon2009_2019Books.1)
colnames(Amazon2009_2019Books.1)

ggplot(data=Amazon2009_2019Books.1, mapping=aes(x=Rating,y=Reviews))+
  geom_point()+
  facet_wrap(~Genre)
#geom_point 48-50, works. Start here with aes editing.

ggplot(data=Amazon2009_2019Books.1, mapping=aes(x=Rating,y=Reviews,color=Genre))+
  geom_point()

ggplot(data=Amazon2009_2019Books.1, mapping=aes(x=Genre))+
  geom_bar(fill="green")

##plotting Amazon dataset - ratings v. reviews parsed out into fiction/nonfiction while accomodating for the price
FctGenre_AZ0919 <- Amazon2009_2019Books.1 %>% 
  ggplot()+
  geom_point(mapping=aes(x=Rating,y=Reviews,color=Price)+
  geom_smooth(mapping=aes(x=Rating,y=Reviews,color=Price), method="loess")+
  facet_wrap(~Genre)+
  labs(title = "Amazon Bestselling Books - Ratings and Reviews", subtitle = "For Years: 2009-2019", caption = "Data: Sooter Saalu's Kaggle Dataset(2020)")

FctGenre_AZ0919
  
bookish_contcolors <- colorRampPalette(c("yellow", "red"))
bookish_rangecolors <- bookish_contcolors(4)

bookish_rangecolors

bookish_contcolors.1 <- colorRampPalette(c("#D81B60", "Black"))
#set the function for colorRampPalette
bookish_rangecolors.1 <- bookish_contcolors.1(4)
#sets the range of values for the HEXs for the bookish_rangecolors.1 value.

bookish_rangecolors.1

FctGenre_AZ0919.1 <- FctGenre_AZ0919 +
  scale_colour_gradientn(colors=bookish_rangecolors.1)

FctGenre_AZ0919.1

Year_AZ0919.1 <- ggplot(data=Amazon2009_2019Books.1)+
  geom_jitter(mapping=aes(x=BestYear, y=Rating, color=BestYear))+
  xlim(NA, 2019)+
  labs(title="Amazon Bestselling Book Ratings", subtitle="From the Years 2009-2019", caption="Data: Sooter Saalu's Kaggle Dataset(2020)", x="Bestselling Year", y="User Book Rating")
Year_AZ0919

Year_AZ0919.2 <- Year_AZ0919.1 +
  annotate("text", x=2011, y=3.4, label="Lowest rating: 3.3 in 2012.", size=3.0, color="#D29F08")

Year_AZ0919.2
#Note to self: Adding layers works best when assigning a new variable.

install.packages(scales)
library(scales)
#using scales package to change the interval tick marks on ggplot viz.

Year_AZ0919.3 <- Year_AZ0919.2 +
  scale_x_continuous(breaks=pretty_breaks())
#using function pretty_breaks() within scales package on x-axis to make the tick marks whole numbers.
Year_AZ0919.3

Year_AZ0919.4 <- Year_AZ0919.3 +
  scale_colour_gradientn(colors=bookish_rangecolors.1)
Year_AZ0919.4
#The values within R may appear to be discrete, but could be coded as continuous. Check data type when 
#attempting to plot and map aesthetics.
