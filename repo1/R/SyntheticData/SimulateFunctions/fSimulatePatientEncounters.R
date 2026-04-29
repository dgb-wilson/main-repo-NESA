fSimulatePatientEncounters <- function(df){
  
  lambda_0 <- 0.8 # base line rate 
  lambda_age <- log(1.02) # every year results in 2% more encounters
  lambda_sex <- log(1.06) # females have 6% more encounters
  
  df$patient_encounter_rate <- exp(lambda_0 + 
                                   lambda_age * (df$AGE) +
                                   lambda_sex * (df$SEX == "Female"))
  
  # sample encounters from negative Binomial distribution
  df$ENCOUNTERS_IN_STUDYPERIOD <- 1 + # must have at least one encounter
                                  rnegbin(nrow(df),
                                  mu = df$patient_encounter_rate,
                                  theta = 2.0 # dispersion parameter
  )
  
  df <- df |> dplyr::select(-patient_encounter_rate)
  
  return(df)
  
}