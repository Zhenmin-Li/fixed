Sam Hawke
BIOS 611
----------------------------------------

I'm going to analyze the Netflix dataset.
----------------------------------------


Proposal
------------------------------------------

Introduction


As the COVID-19 pandemic continues with no clear end in sight, Netflix increasingly becomes a part of modern life than ever before. While TV and movies have always been a way to forget the tragedies of day-to-day life, such a mechanism seems more important nowadays than before the pandemic.

So what kind of content is Netflix producing? Do they have a bias in terms of which genres they make more available?

Additionally, certain shows on Netflix are more "successful" than other shows. In particular, the shows that get more seasons were renewed because Netflix executives thought they were worth it. Are there certain types of shows that get renewed more than others? Do the shows with many seasons have something in common?

This project will do descriptive statistics of (at least one) publicly available data set(s). We will also look at certain models to try to predict the nu mber of seasons for which a TV show runs based on other variables.

If time permits, we may do some clustering and machine learning.


Datasets
-------------------

The datasets we will analyze are publicly available on Kaggle and can be downloaded here: https://www.kaggle.com/shivamb/netflix-shows



Preliminary Figures
----------------------

![Image 1](“Artifacts/image1.png”)
![Image 2](“Artifacts/image2.png”)
![Image 3](“Artifacts/image3.png”)
![Image 4](“Artifacts/image4.png”)


Usage
------

You'll need Docker and the ability to run Docker as your current user.

This Docker container is based on rocker/verse. To run rstudio server:

    > docker run -v "`pwd`:/home/rstudio" -p 8787:8787\
    -e PASSWORD=mypass -t project1-env

Then, connect to the machine on port 8787.

