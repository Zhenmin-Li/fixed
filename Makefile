.PHONY: clean

clean:
	rm derived_data/*
  
derived_data/netflix.csv:\
 source_data/netflix_titles.csv\
 tidy_data.R
	Rscript tidy_data.R

make Artifacts/image1.r

make Artifacts/image2.r