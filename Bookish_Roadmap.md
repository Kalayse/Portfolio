# Case Study - Bookish

## Introduction:
This section is meant to be used as my self guided exploration for my Bookish Case Study. The intent with this document is to outline the data analysis process so that I might better stay on task, asking the right questions, and exploring each section fully. Additionally, this section will contain some of the guiding principals from Google's Data Analytics Professional Certification on Coursera. The information contained within this case study is purely based on my interest and curiousity in the topic. There has been no financial impact when picking this topic for exploration.

## Ask Phase:
- What topic are you exploring? 
> The topic that I'm exploring is related to my interests as a user of Goodreads and as a bookish person. I want to take datasets and explore book ratings, book genres, book titles, and sales and see how they relate to each other.
- What is the problem you're trying to solve? 
> My goal is to see if there's a meaningful relationship between the user reviews (count and rating) and the book attributes (such as page count and name). I want to visualize the titles and keywords as they compare to review count, discover if there's a meaningful relationship between the book type and the review count, and see if there's an impact of a book that may seem trendy even though it is undesirable in some way.
- What metrics will you use to measure your data to achieve your objectives? Who are your stakeholders? 
> The metrics I will be using will include various summary statistics such as min, avg, max, count, and sd. My stakeholders are bookish people from the average consumer to the bookworm with the potential to have stakeholders such as authors, publishers, retail sites, and book reviewing platforms.
- Who is your audience for this analysis and how does this affect your analysis process and presentation? 
> My primary audience for this project are bookish people who like to see their pass time in a data story. I seek to use public information and make it digestible in a way that bookish people would be interested to think about what effects them when they purchase, read, or review a book.

## Prepare Phase:
- Where is your data located? 
> The data that I will be using was sourced from Kaggle where users previously requested it from Goodreads'. Links to the Kaggle datasets and the Goodreads' TOS will be available. Additionally, some of the information (genre and cost) were manually sourced using Google.
- How is your data organized? 
> The data I'm using is organized into .CSV files which has been imported into *BigQuery* and *RStudio* for exploration.`
- Are there issues with bias or credibility in this data? Does your data ROCCC? 
> Reminder: ROCCC is reliable, original, comprehensive, current, and cited. The data that I'm using from Kaggle would ROCCC per their [page that discusses](https://www.kaggle.com/docs/datasets) datasets. There is an issue with it not being original, however, since I obtained it through a third party and not directly from Goodreads'. Additionally, the data is only as current as December 2020, when Goodreads' changed their [API policy](https://www.goodreads.com/api/terms).
- How are you addressing licensing, privacy, security, and accessibility?
> I am ensureing that the raw_data that I have used is linked and referenced accordingly. Kaggle's website encourages dataset publishers to make their dataset open, accessible, and non-proprietary if they are listed publicly.
- How did you verify the data's integrity?
> I verified the data's intregtiy by cross referencing a random sample against the Goodreads' site. There is some bias in the data, because the analysis I am doing is only based on the review attributes of Goodreads'. If a bookish person uses another method of tracking and reviewing, this information would not be available as part of my analysis. Additionally, other apps with reviews are less accessible in an open source environment. When I attempted to cross reference some book attribute information with [ISBN](https://isbndb.com), there was a pay wall I hit and I am unable to utilize their services as part of my open source analysis.
- Are there any problems in your data?
> Some of the book information is formatted into strings such as the book title and author. The book title can have many variations that includes editions, books within series, etc. The authors section may or may not contain collaborators, co-authors, and it may use terms like 'et al' or 'and one other'. Additionally, for page count, some books have a variety of editions with varying page counts depending on if the book contains an interview, a sneakpeak at another book, a prologue, etc.

## Process Phase:
- What tools are you choosing and why?
> The tools that I'm using will include SQL in BigQuery, R in RStudio, Kaggle for datasets, Tableau for Data Visualizations, and some minor use of Spreadsheets with Google Sheets. I'm utilizing these tools, because they have been the focal point of the Google Data Analytics Professional Certification on Coursera. BigQuery will be used for various cleaning and manpulating of the data, and RStudio will be used for more data manipulation and data visualizations.
- Have you ensured the data's integrity?
> I have reviewed and analyzed the data for bias while ensuring that I am not misinterpreting or misrepresenting the data as I transform it. Additionally, I am utilitzing datasets that are cited and open following data ethics practices of providing transparency.
- What steps have you taken to ensure that your data is clean?
> The cleaning process began in BigQuery. Using the schema section, I reviewed the field_name and data_type for the applicable datasets. This helped me identify reference columns, if I needed to use cleaning functions (such as CAST(), LENGTH(), TRIM(), MIN(), MAX(), COUNT(), IS NULL, DISTINCT(), etc.), and data manipulating actions (JOINS, ALTER TABLE, UPDATE, RENAME COLUMN) to generate a data.table that would be useful in analysis.
- How can you verify that your data is clean and ready to analyze?
> When validating my data, I did find that I needed additional data to round out one of the datasets. I manually set out to add a column for current price and genre for a subset of the books I was reviewing. The data is uniformly formatted and is capatible with the tools I am using for data analysis. Prior to my analysis the data seems to support my thoughts that the higher review count tends to lead to a better (or at least more accurate) rating. Additionally, there seems to be a correlation between book genre and number of reviews on Amazon.

## Analyze Phase:
- How should you organize your data to perform an analysis on it?
> Initially, I organized data based on the original datasource (Amazon or Goodreads). I then went on to ensure that naming conventions were utilized when I went into manipulating the data to form new tables, save variables, and visualize the data in a meaningful way.
- Has your data been properly formatted?
> There was some struggles, because the original source for the Amazon dataset utilized spaces in column_names, which made the columns difficult to reference. Additionally, it is unavoidable when discussing book_titles to *not* have strings, because the strings give meaningful information to the data whereas the ISBN would be more accurate - it would be difficult to determine much in terms of context. Additionally, since there was a pay wall for access to the ISBNdb I found myself relaying more on the publicly accessible information and less on what the ISBNdb could offer me.
- What surprises did you discover in your data?
> I was surprised to find out that the most reviewed books by a more comprehesive genre breakdown, which I manually conducted on a sample size, was geared towards Children's books being the most commonly reviewed for Amazon's Best Sellers from 2009-2019.
- What trends or relationships did you find in the data?
> When looking deeper at the Amazon Best Sellers, each year did have 50 total books listed. Additionally, reported rating only dipped below 3.5 for the User_Rating 1 out of 550 total instances (3.3 rating in 2012 for "The Casual Vacancy" by JK Rowling). This means to me, that in order for something to be considered a bestseller, that the User_Rating would be at least 3.3. 

## Share Phase:
- What story does your data tell?
> Based on the data, when Amazon reviews tend to favor Fiction genre books. Within that, they tend to heavily favor Children's books for a high rating. I found this surprising, because that means that the person reviewing the book is likely not the intended audience for the book, but the parent (or other purchaser). Within the Top 15 Amazon best selling books from 2009-2019, there are very prominent authors that will likely sell books based on their name alone such as John Green, Michelle Obama, and Suzanne Collins. I would be interested to see the relationship between movie releases and book sales. Briefly, we can see that The Hunger Games (Book 1) by Suzanne Collins was a best seller in 2010, 2011, and 2012 for Amazon and the movie, The Hunger Games, was released in 2012. 
- How do your findings relate to your original question?
> I was not entirely able to solve my original question when discussing the number of pages and how it relates to book reviews. This information is difficult to determine, because there's a vast difference within a same title based for page count. Some books that share the same name may have bonus chapters, author interviews, and prologues that aren't available in all books of the same title. In order to better answer this question, I would have had to access ISBNdb, which has a pay wall, and doesn't fit into the scope of the portfolio. 
- Is your findings accessible to your audience? How?
> Within my portfolio the following can be accessed: the visualization .PNGs from RStudio, links to the original datasets, a Tableau link to the word cloud, and the accompanying code I wrote.

## Act Phase:
This phase is added to complete the data analysis process. There will be no action for the Act Phase on my behalf.
