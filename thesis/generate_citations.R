# rbbt::bbt_write_bib('./thesis/bibliography.json',
#                     keys = rbbt::bbt_detect_citations(
#                       list.files("./thesis/", 
#                                  pattern ='*.Rmd',
#                                  full.names=TRUE)),
#                     overwrite = TRUE)


rbbt::bbt_write_bib('./thesis/bibliography.bib',
                    keys = rbbt::bbt_detect_citations(
                      list.files("./thesis/", 
                                 pattern ='*.Rmd',
                                 full.names=TRUE)),
                    overwrite = TRUE)

