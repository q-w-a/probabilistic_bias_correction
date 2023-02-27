
all: thesis data county_results

thesis_output: thesis
      # generate citations based on Rmd files in thesis directory
			Rscript thesis/generate_citations.R 
			# knit thesis 
			# need to change into thesis directory so rendering works correctly
			#cd thesis; Rscript -e "bookdown::render_book('index.Rmd')"
			cd thesis;ls;  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

data: analysis/data_cleaning/data_cleaning.Rmd
			Rscript -e "rmarkdown::render('analysis/data_cleaning/data_cleaning.Rmd')"
			
			
county_results: analysis/county_level_correction/county_correction.Rmd analysis/base_functions/base_functions.R analysis/data_cleaning/data_cleaning.Rmd
			Rscript -e "rmarkdown::render('analysis/county_level_correction/county_correction.Rmd', params = list(state = 'ma'), output_file = 'county_level_correction_ma.html')"
			Rscript -e "rmarkdown::render('analysis/county_level_correction/county_correction.Rmd', params = list(state = 'mi'), output_file = 'county_level_correction_mi.html')"