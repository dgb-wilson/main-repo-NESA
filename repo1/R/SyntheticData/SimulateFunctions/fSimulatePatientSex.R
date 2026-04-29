fSimulatePatientSex <- function(df,
                                nb_practices){

sex_practice_effect <- rnorm(nb_practices, mean = 0, sd = 0.45)

logit <- function(p) log(p / (1 - p))
inv_logit <- function(x) exp(x) / (1 + exp(x))

prob_female_practice <- inv_logit(
  logit(0.5) + sex_practice_effect
)

df$SEX <- rbinom(
  nrow(df),
  size = 1,
  prob = prob_female_practice[df$PRACTICE_ID]
)

df$SEX <- ifelse(df$SEX == 1, "Female", "Male")

return(df)
}
