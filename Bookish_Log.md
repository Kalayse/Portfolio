# Chronological Notes

## Purpose:
Exploring what I have learned so far in [Coursera's Google Data Analytics Professional Certificate](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjo9ZyPyv75AhVeGzQIHaScBUIQFnoECBUQAQ&url=https%3A%2F%2Fwww.coursera.org%2Fprofessional-certificates%2Fgoogle-data-analytics&usg=AOvVaw2XvP900KPIKu1611eqZ7QH). This log should serve as a compilation of all the actions, research, and progess on my final project with Coursera. The topic is Bookish. Please visit -ReadMe link, to be inserted later- for more details.

## 5-Sept-22 
When uploading the Goodreads-books by Soumik dataset to *BigQuery*, I had to find and replace all instances of " to a single quote '. 
*BigQuery* was receiving an error and failed to upload with the double quote.

## 6-Sept-5
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

## Datasets Used:
- [Goodreads-books by Soumik](https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks).
- [Amazon Top 50 Bestselling Books 2009-2019 By Sooter Saalu](https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019).

## Additional Information:
[Goodreads Developer Terms of Service](https://www.goodreads.com/api/terms). 
