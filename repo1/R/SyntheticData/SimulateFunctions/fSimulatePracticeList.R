fSimulatePracticeList <- function(nb_phns=10,
                                  nb_practices_per_phn=25){
  
  nb_practices = nb_phns*nb_practices_per_phn
  
  data("words")
  
  practice_list <- data.frame(PRACTICE_ID = 1:nb_practices,
                              AREA_ID = rep(1:nb_phns,each=nb_practices_per_phn),
                              PRACTICE_ID_TRUE = paste0(sample(words,nb_practices) |> str_to_title(),
                                                        " Practice"))
  
  return(practice_list)
}
