
all: data/state_level/tests_daily_all_states.RDS analysis/county_level_correction/county_level_correction_ma.html thesis/_book/thesis.pdf analysis/state_level_correction/state_level_correction.html presentation/final_presentation.html


# link on use of wildcard:
# https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html
thesis/_book/thesis.pdf:  $(wildcard thesis/*) analysis/vignettes/cross_correlation_wastewater.Rmd analysis/vignettes/state_results.Rmd analysis/vignettes/county_results.Rmd analysis/data_cleaning/data_cleaning.Rmd
      # generate citations based on Rmd files in thesis directory
			Rscript thesis/generate_citations.R 
			# knit thesis 
			# need to change into thesis directory so rendering works correctly
			cd thesis; Rscript -e "bookdown::render_book('index.Rmd')"
			#cd thesis;ls;  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

data/state_level/tests_daily_all_states.RDS: analysis/data_cleaning/data_cleaning.Rmd
			Rscript -e "rmarkdown::render('analysis/data_cleaning/data_cleaning.Rmd')"
			
			
analysis/county_level_correction/county_level_correction_ma.html: analysis/county_level_correction/county_correction.Rmd analysis/base_functions/base_functions.R analysis/data_cleaning/data_cleaning.Rmd
			Rscript -e "rmarkdown::render('analysis/county_level_correction/county_correction.Rmd', params = list(state = 'ma'), output_file = 'county_level_correction_ma.html')"
			Rscript -e "rmarkdown::render('analysis/county_level_correction/county_correction.Rmd', params = list(state = 'mi'), output_file = 'county_level_correction_mi.html')"

analysis/state_level_correction/state_level_correction.html:
			Rscript -e "rmarkdown::render('analysis/state_level_correction/state_correction.Rmd')"
			

presentation/final_presentation.html: analysis/data_cleaning/data_cleaning.Rmd analysis/state_level_correction/state_correction.Rmd analysis/county_level_correction/county_correction.Rmd $(wildcard analysis/vignettes/*)
			quarto render presentation/final_presentation.qmd


			
