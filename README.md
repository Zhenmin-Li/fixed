Sam Hawke
BIOS 611
----------------------------------------

I'm going to analyze the Netflix dataset.
----------------------------------------


This repo will eventually contain an analysis of the Netflix dataset.


Usage
------

You'll need Docker and the ability to run Docker as your current user.

This Docker container is based on rocker/verse. To run rstduio server:

    > docker run -v "`pwd`:/home/rstudio" -p 8787:8787\
    -e PASSWORD=mypass -t project1-env

Then, connect to the machine on port 8787.

