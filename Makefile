.PHONY: clean

clean:
	rm derived_data/*
	
Report.pdf: Report.Rmd
	R -e "rmarkdown::render('Report.pdf', output_format='pdf_document')"
  
derived_data/netflix.csv:\
 source_data/netflix_titles.csv\
 tidy_data.R
	Rscript tidy_data.R
	
derived_data/movies.csv:\
 source_data/netflix_titles.csv\
 tidy_data.R
	Rscript tidy_data.R
	
derived_data/tv.csv:\
 source_data/netflix_titles.csv\
 tidy_data.R
	Rscript tidy_data.R