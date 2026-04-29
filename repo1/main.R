# Practice reports data preparation
# Dan Wilson

# load all packages
library(dplyr)
library(DBI)
library(readr)
library(stringr)
library(MASS)
library(duckdb)

# simulation parameters for generating synthetic practice data

nb_phns=5
nb_practices_per_phn=20

sim_params <- list(
  generate_data = TRUE,
  nb_phns=nb_phns,
  nb_practices_per_phn=nb_practices_per_phn,
  nb_practices = nb_phns*nb_practices_per_phn,
  min_patients_per_prac = 200,
  max_patients_per_prac = 1500,
  max_age_of_patients = 100)



sourceR <- function(folder) lapply(list.files(folder, pattern=".*R$"), function(x) source(file.path(folder, x)))

lapply(c("R/General"), sourceR)

if(sim_params$generate_data){
  # generate synthetic health data
  source("R/SyntheticData/SimulateDataset.R")
}

# perform data preparation on synthetic data
source("R/RunDataPrep.R")

# prepare data for all charts
source("R/PrepareCharts.R")

  
