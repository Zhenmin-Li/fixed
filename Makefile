.PHONY: clean

clean:
	rm derived_data/*
  
derivated_data/netflix.csv:\
 source_data/netflix_titles.csv\
 tidy_data.R
	Rscript tidy_data.R

image1.r

image2.r