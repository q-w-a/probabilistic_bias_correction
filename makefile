
thesis_output: thesis
      # generate citations based on Rmd files in thesis directory
			Rscript thesis/generate_citations.R 
			# knit thesis 
			# need to change into thesis directory so rendering works correctly
			#cd thesis; Rscript -e "bookdown::render_book('index.Rmd')"
			cd thesis;ls;  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

# remake with any changes to any files in data cleaning directory
DATA_CLEANING_FILES = $(find ./analysis/data_cleaning -type f -name '*')
data: analysis/data_cleaning $(DATA_CLEANING_FILES)
			Rscript -e "rmarkdown::render('analysis/data_cleaning/data_cleaning.Rmd')"