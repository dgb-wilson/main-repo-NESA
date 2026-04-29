fSimulatePatientCohort <- function(min_patients_per_prac,
                                   max_patients_per_prac,
                                   nb_practices,
                                   nb_phns){
  

# sample the number of patients attending each practice
patient_cohort <- fSimulatePracticePatientCount(min_patients_per_prac,
                                                max_patients_per_prac,
                                                nb_practices)


# generate sex of each patient with a practice level random effect

patient_cohort <- patient_cohort |> fSimulatePatientSex(nb_practices)

# generate age of each patient with a fixed effect for sex and a random effect for PHN

patient_cohort <- patient_cohort |> fSimulatePatientAge(nb_practices)

# generate a number of encounters per patient at each practice
# using a negative binomial distribution with a fixed effect for 
# SEX and a linear effect for AGE

patient_cohort <- patient_cohort |> fSimulatePatientEncounters()

return(patient_cohort)
}
