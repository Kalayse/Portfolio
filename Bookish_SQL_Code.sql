SELECT 
Id, Name, pagesNumber, concat(PublishMonth,"-",PublishDay,"-",PublishYear) AS Publish_Date_MMDDYYYY, Publisher, CountsOfReview, Authors, Rating, ISBN
FROM Goodreads.BJ_thru100k

SELECT 
Id, Name, pagesNumber, concat(PublishMonth,"-",PublishDay,"-",PublishYear) AS Publish_Date_MMDDYYYY, Publisher, CountsOfReview, Authors, Rating, ISBN
FROM Goodreads.BJ_100k200k
#lines1-6, filtering original CSV files to make them useable for analysis removing redundant columns referencing ratingdistribution.
#Noticed that Publish_Date_MMDDYYYY is incorrect. Original date was mislabeled between what was a month and a day. Reconfiguring.

ALTER TABLE Goodreads.FilteredGR_BJ_100k200k
RENAME COLUMN Publish_Date_MMDDYYYY to Pub_Date_DDMMYYYY
ALTER TABLE Goodreads.FilteredGR_BJ_thru100k
RENAME COLUMN Publish_Date_MMDDYYYY to Pub_Date_DDMMYYYY
#Column names for both tables were successfully updated to reflect DDMMYYYY.

SELECT
COUNT(DISTINCT Publisher) AS Unique_Publisher
FROM
Goodreads.FilteredGR_BJ_thru100k
#Viewing unique publishers (result was 7520) in dataset to see if it's worth having the publisher be a limiter.

SELECT
MIN(CountsOfReview) AS Min_ReviewCT, MAX(CountsOfReview) AS Max_ReviewCT, AVG(CountsOfReview) AS AVG_ReviewCT
FROM
Goodreads.FilteredGR_BJ_thru100k
#Min_ReviewCT is 0, Max_ReviewCt is 94850, AVG_ReviewCT is 147.79

SELECT
MIN(CountsOfReview) AS Min_ReviewCT, MAX(CountsOfReview) AS Max_ReviewCT, AVG(CountsOfReview) AS AVG_ReviewCT,
FROM
Goodreads.FilteredGR_BJ_100k200k
#For other dataset: Min_ReviewCT is 0, Max_ReviewCT is 52088, AVG_ReviewCT is 37.35

SELECT
Name,CountsOfReview, Rating, ntile(100) OVER (PARTITION BY CAST(Rating AS int64) ORDER BY CountsOfReview) AS Percentile,
FROM
Goodreads.FilteredGR_BJ_thru100k
#saved table generated with percentile, consider nested query in the future. Typecasted Rating from Float to Int. Table is showing percentile in relation to the overall rating and number or reviews.

SELECT
Name, CountsOfReview, Percentile, Rating
FROM
Goodreads.PTile_BJthru100k
WHERE
Percentile = 95
#Viewing only the 95th percentile forming a bell curve with CountsOfReviews and Ratings. Visualizing with R.

SELECT 
MIN(Pub_Date_DDMMYYYY) AS OLDEST_PUB, MAX(Pub_Date_DDMMYYYY) AS NEWEST_PUB
FROM 
Goodreads.FilteredGR_BJ_thru100k

SELECT 
Id AS ID, Name, pagesNumber AS Pages, PublishYear, Publisher, CountsOfReview AS ReviewCT, Authors, CAST(Rating AS int64), ISBN
FROM 
Goodreads.RAW_GRBJ AS FILTERERD_GRBJ
#Utilitze table FILTERED_GRBJ moving forward for analysis with year, page numbers, rating, and CountsofReviews
#Dropping from FILTERED_GRBJ all books with less than 100 pages, 0 Reviews, and 0 Rating.

ALTER TABLE Goodreads.FILTERED_GRBJ
RENAME COLUMN f0_ TO Rating

SELECT
*
FROM
Goodreads.FILTERED_GRBJ
WHERE
Pages >= 100 AND ReviewCT > 1 AND Rating > 0;
#saved table as csv named NoZero_GRBJ

SELECT
FILTERED_GRBJ.Name AS BookTitle, Authors, FILTERED_GRBJ.Pages AS Pages, FILTERED_GRBJ.PublishYear AS PublishYear, FILTERED_GRBJ.Rating AS GRRating, FILTERED_GRBJ.ReviewCT AS GRReviews, Amazon_Best.User_Rating AS AmazonRating, Amazon_Best.Reviews AS AmazonReviews
FROM
Goodreads.FILTERED_GRBJ
INNER JOIN
Goodreads.Amazon_Best ON
FILTERED_GRBJ.Name = Amazon_Best.Name;

SELECT 
COUNT(DISTINCT(BookTitle)) AS UniqueBooks
FROM
Goodreads.Combined_BookAuthor
#Total unique books in table is 22.

SELECT
Length(BookTitle) AS title_characters, BookTitle
FROM
Goodreads.Combined_BookAuthor
WHERE
SUBSTR(BookTitle, 5, 5) = "Great"
#Viewing the length of the sting (unique key) for multiple instances of the same BookTitle. All instances have 16 characters. No need to TRIM(). 
#Verifying there were no leading or additional spaces added to the BookTitle ("The Great Gatsby").

SELECT
DISTINCT(FILTERED_GRBJ.Name) AS UniqueBooks, FILTERED_GRBJ.PublishYear AS Year, Authors,
FROM
Goodreads.FILTERED_GRBJ
WHERE
TRIM(UniqueBooks)
INNER JOIN
Goodreads.Amazon_Best ON
FILTERED_GRBJ.Name = Amazon_Best.Name;
