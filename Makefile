.PHONY: clean

clean:
	rm derived_data/*
	
Report.pdf: Report.Rmd\
 derived_data/netflix.csv\
 derived_data/tv.csv\
 derived_data/movies.csv\
 derived_data/naive_linear_model.rds\
 derived_data/linear_model1.rds
	R -e "rmarkdown::render('Report.Rmd', output_format='pdf_document')"
	
derived_data/naive_linear_model.rds: derived_data/netflix.csv derived_data/tv.csv derived_data/movies.csv build_model0.R
	Rscript build_model0.R
	
derived_data.linear_model1: derived_data/netflix.csv derived_data/tv.csv derived_data/movies.csv model1.R
	Rscript model1.R
	
derived_data.linear_model2: derived_data/netflix.csv derived_data/tv.csv derived_data/movies.csv model2.R
	Rscript model2.R
  
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