# Chronological Notes

## Purpose:
Exploring what I have learned so far in [Coursera's Google Data Analytics Professional Certificate](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjo9ZyPyv75AhVeGzQIHaScBUIQFnoECBUQAQ&url=https%3A%2F%2Fwww.coursera.org%2Fprofessional-certificates%2Fgoogle-data-analytics&usg=AOvVaw2XvP900KPIKu1611eqZ7QH). This log should serve as a compilation of all the actions, research, and progess on my final project with Coursera. All the code I used will be available for both R and SQL witin my portfolio. Please visit -ReadMe link, to be inserted later- for more details.

## 5-Sept-22 
When uploading the Goodreads-books by Soumik dataset to *BigQuery*, I had to find and replace all instances of " to a single quote '. 
*BigQuery* was receiving an error and failed to upload with the double quote.

## 6-Sept-22
Uploaded Amazon Top 50 Bestselling Books 2009-2019 by Sooter Saalu into *BigQuery*. Currently, finding relative datasets from Kaggle to explore using SQL. My intent is to compare multiple Bookish datasets. I am considering exploring other datasets that are outside of Goodreads, but at this time, I continue using Goodreads datasets as the main source of information. 

Potential courses of action and information to research:
- Word cloud visualization for titles, genres, or reviews.
- Datasets outside of Goodreads. It appears that the Amazon Top 50 compiles the information from Goodreads based on Saalu's notebook in Kaggle. Other places to consider are [Tableau](https://public.tableau.com/app/discover), [Medium](https://medium.com/search?q=books), and Kaggle.
- There are datasets that contain information from libraries on which books are loaned. This might be useful in comparing the loans to Goodreads reviews. View possible datasets [here](https://data.world/datasets/books).
- Good [visualizations](https://ourworldindata.org/books) for the history of books over the last century.
- [ISBNdb](https://isbndb.com/) appears to have a free 7 day trial, but they will have the book list price. This might be interesting to compare with book reviews. Unsure of how to cite/access of the information, but it appears that once your subscription is terminated you should delete all information. Research further.
- Compare user rating on Amazon Dataset to rating on Goodreads dataset.

Accessing Medium to browse, I found that the website focuses mostly on case studies and presents them in a blog post way. The few I accessed seemed to focus mostly on books and reading as a hobby without physical data that I would need. I accessed a "Member-Only" page. Medium only allows 3 member only pages per month before you have to opt in for a subscription. 

#### Medium Case Studies for Background Information to Bookish Case Study:
- Kris Gage's [8 Things I Learned Reading 50 Books A Year for 7 Years](https://medium.com/@krisgage/8-things-i-learned-reading-50-books-a-year-for-7-years-cb11c4acffb1). Note: Member-Only.
- Sylvie Stephanie's [Goodreads App - UX Case Study](https://medium.com/muzli-design-inspiration/goodreads-app-ux-case-study-2e63214fc005). `Takeaways from the this user's case study: Goodreads is primarily a book review and recommendation platform with 90 million users and 2.6 billion books in 2019. The Goodreads app had a 4.8 star rating on iOS and a 4.0 rating on Android, which the poster assumes is because there's access/design differences. The poster goes on to say that the app reviews compare the app to the website, and app has less functionality in comparison. The poster did a small survery of 35 people that used the app. The survey revealed that most of the survery's participants used the app for ratings and reviews as it was there they spent the most time, what they trusted the most, and the sections they accessed the most.`

## 7-Sept-22
Today, I decided to update part of another Goodreads' dataset by Bahram Jannesar et al., which includes multiple .csv files. Each file has more than 50k books and there are .csv files for user ratings. When I reviewed the user ratings, they were strings that seemed to be an array of the same content, which is likely the string response for a star level. For example, 4 stars could mean 'Really Like It'. I will not be using this part of the dataset in my analysis.

Moving forward with these three datasets. I will be reviewing content. This will help me see what needs to be cleaned, combined, and what needs more context in order to avoid potential gaps in my analysis. At this time, I feel like a major gap that will force me to pivot would be related to list price for each book. I did consider researching and building my own list_price column. If I decide on this course of action, I will only do it for a subset of the data.

In *BigQuery*, I have started cleaning and manipulating data starting with Jannesar's dataset. My goal for today is to configure all the raw data into tables that will prove more useful in my analysis. I think I will have to put a limit on the user ratings for the tables in order to limit the processing time as well as the amount of data I'm working with. I could remove everything that has no review and no rating. Alternatively, I could come up with a basic metric to say (this type of book) yields low reviews and ratings.

Utilitzed *BigQuery* and *RStudio* to obtain summary statistics on Jannesar's dataset for the first 100k entries. Results are as follows for CountOfReviews:`'Min_ReviewCT is 0, Max_ReviewCt is 94850, AVG_ReviewCT is 147.79`. Using the ntile( ) function, I was able to obtain the percentile for Ratings and Ordered by the CountsOfReviews: `SELECT
Name,CountsOfReview, Rating, ntile(100) OVER (PARTITION BY CAST(Rating AS int64) ORDER BY CountsOfReview) AS Percentile,
FROM
Goodreads.FilteredGR_BJ_thru100k
#Typecasted Rating from Float to Int. Table is showing percentile in relation to the overall rating and number or reviews.`. Visualized results in *RStudio*. 

## 8-Sept-22
**To do list:**
- Obtain a subset of books through a random generation script - currently thinking 5 books. From Goodreads' website obtain more about review information. Consider manually logging the breakdown of reviews and the timeframe of each review.
- Focus mostly on Jannesar's dataset in order to focus in on the questions I'm trying to answer.

## 12-Sept-22
I ended my session on 8-Sept-22 by using INNER JOIN to combine a Goodreads' dataset with an Amazon dataset. The dataset only was able to INNER JOIN matching values in both tables and therefor all values were not account for. Since I joined on strings, the string had to have been an exact match. Additionally, I only joined a small segment of the Goodreads' dataset, which was up to 100k books. This new data set includes book titles, page count, publishing year, Goodreads' rating, Goodreads' reviews, Amazon Rating, and Amazon Reviews. With 22 distinct books, I will be manually adding the OriginalPrice to the dataframe.  

When adding the cost to the dataframe, the following issues were encountered: unable to determine original price of the book in the print/sale year, the current price of the book is based on market demand, and there's lots of reprints of books (such as Dante's Inferno). The current cost of the book is my 'best guess' at what a standard book from that publishing year would cost. If there was a range of prices (as you would find with eBay), I averaged the min/max.

**To do list:**
-Explore potential relationship between Amazon review count, Goodreads' review count, and genre for the combined dataset.

## 13-Sept-22
Visualized the dataframe from the Inner Joins on Goodreads' and Amazon dataset. The dataset is a subset of all the Amazon Best Sellers from 2009-2019 (referred to as Amazon2009_2019Books in RStudio). I was able to manually add all genres and current cost of the 22 distinct books. Once I ensured the data was clean, I imported that dataset into RStudio to visualize the data with ggplot2. Using ggplot2, I was able to visualize the attributes Rating, Sample Counts, and Genres into a bar graph. I then added labels to make the [viz](https://e6521897e0d44ddba8de83caa978a2bf.app.rstudio.cloud/file_show?path=%2Fcloud%2Fproject%2FDataframe+Fun%2FBookish+Portfolio%2FBar_AZGR.png) more accessible.

I decided to explore the complete Amazon2009_2019Books to create more comprehensive visualizations that include more data. I will be using geom_smooth and geom_point along with mapping aesthetics.

## Datasets Used:
- [Goodreads-books by Soumik](https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks).
- [Amazon Top 50 Bestselling Books 2009-2019 By Sooter Saalu](https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019).
- [Goodreads Book Dataset with User Rating 2M by Bahram Jannesar and 1 Collaborator](https://www.kaggle.com/datasets/bahramjannesarr/goodreads-book-datasets-10m). 

## Additional Information:
[Goodreads Developer Terms of Service](https://www.goodreads.com/api/terms). 
