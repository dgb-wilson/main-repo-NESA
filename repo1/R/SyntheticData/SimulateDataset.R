# generate a synthetic dataset to use in the demo workflow

# create a database using duckdb
con <- dbConnect(duckdb::duckdb(), 
                 dbdir = "Data/PracticeReportData.duckdb", 
                 read_only = FALSE)

# load functions
scripts <- list.files(
  path = "R/SyntheticData/SimulateFunctions",
  pattern = "\\.R$",
  full.names = TRUE
)
lapply(scripts, function(f) source(f, echo = FALSE, verbose = FALSE))

# seed for reproducibility
set.seed(123)

# add practice table
practicelist <- fSimulatePracticeList(nb_phns = sim_params$nb_phns,
                                      nb_practices_per_phn = sim_params$nb_practices_per_phn)
dbWriteTable(con, 
             "GPEHR_PRACTICE", 
             practicelist,
             overwrite = TRUE)

# add patient cohort table
patientcohort <- fSimulatePatientCohort(min_patients_per_prac = sim_params$min_patients_per_prac,
                                        max_patients_per_prac = sim_params$max_patients_per_prac,
                                        nb_practices = sim_params$nb_practices,
                                        nb_phns = sim_params$nb_phns)

dbWriteTable(con, 
             "GPEHR_PATIENT_SUMMARY", 
             patientcohort,
             overwrite = TRUE)


disconnectdb(con)


