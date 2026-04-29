fSimulatePatientAge <- function(df,
                                nb_phns){
  
beta_0   <- 50     # baseline mean age
beta_sex <- 5     # females are 5 years older
sd_phn   <- 5      # between-PHN variability
sd_ind   <- 18     # individual variability


phn_effect <- rnorm(nb_phns, mean = 0, sd = sd_phn)

df$AGE <- round(
    beta_0 +
    beta_sex * (df$SEX == "Female") +
    phn_effect[df$AREA_ID] +
    rnorm(nrow(df), mean = 0, sd = sd_ind)
)

df$AGE <- pmin(pmax(df$AGE, 0), 100)

return(df)

}