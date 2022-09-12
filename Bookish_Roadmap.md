# Case Study - Bookish

## Introduction:
This section is meant to be used as my self guided exploration for my Bookish Case Study. The intent with this document is to outline the data analysis process so that I might better stay on task, asking the right questions, and exploring each section fully. Additionally, this section will contain some of the guiding principals from Google's Data Analytics Professional Certification on Coursera. The information contained within this case study is purely based on my interest and curiousity in the topic.

## Ask Phase:
- What topic are you exploring? 
> The topic that I'm exploring is related to my interests as a user of Goodreads and as a bookish person. I want to take datasets and explore book ratings, book genres, book titles, and sales and see how they relate to each other.
- What is the problem you're trying to solve? 
> My goal is to see if there's a meaningful relationship between the user reviews (count and rating) and the book atrributes (such as page count and name). I want to visualize the titles and keywords as they compare to review count, discover if there's a meaningful relationship between the book type and the review count, and see if there's an impact of a book that may seem trendy even though it is undesirable in some way.
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
> Reminder: ROCCC is reliable, original, comprehensive, current, and cited. The data that I'm using from Kaggle would ROCCC per their [page that discusses](https://www.kaggle.com/docs/datasets) datasets. There is an issue with it not being original, however, since I obtained it through a third party and not directly from Goodreads'. Additionally, the data is only as current as December 2020, when Goodreads' changed their API policy.
- How are you addressing licensing, privacy, security, and accessibility?
> I am ensureing that the raw_data that I have used is linked and referenced accordingly. Kaggle's website encourages dataset publishers to make their dataset open, accessible, and non-proprietary if they are listed publicly.
- How did you verify the data's integrity?
> I verified the data's intregtiy by cross referencing a random sample against the Goodreads' site. There is some bias in the data, because the analysis I am doing is only based on the review attributes of Goodreads'. If a bookish person uses another method of tracking and reviewing, this information would not be available as part of my analysis. Additionally, other apps with reviews are less accessible in an open source environment. When I attempted to cross reference some book attribute information with [ISBN](https://isbndb.com), there was a pay wall I hit and I am unable to utilize their services as part of my open source analysis.
- Are there any problems in your data?
> Some of the book information is formatted into strings such as the book title and author. The book title can have many variations that includes editions, books within series, etc. The authors section may or may not contain collaborators, co-authors, and it may use terms like 'et al' or 'and one other'. Additionally, for page count, some books have a variety of editions with varying page counts depending on if the book contains an interview, a sneakpeak at another book, a prologue, etc.

## Process Phase:
- What tools are you choosing and why?
- Have you ensured the data's integrity?
- What steps have you taken to ensure that your data is clean?
- How can you verify that your data is clean and ready to analyze?

## Analyze Phase:
- How should you organize your data to perform an analysis on it?
- Has your data been properly formatted?
- What surprises did you discover in your data?
- What trends or relationships did you find in the data?

## Share Phase:
- What story does your data tell?
- How do your findings relate to your original question?
- Who is your audience? What is the best way to communicate with them?
- Is your presentation accessible to your audience? How?

## Act Phase:
This phase is added to complete the data analysis process. There will be no action for the Act Phase on my behalf.
