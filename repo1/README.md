# PracticeReportsDataPrep
Generates synthetic practice data for report generation. Further data processing creates tables needed for chart generation.

## Overview

The entire pipeline can be run to end to end by executing the main.R script, the only dependencies are the packages stated in main.R

### Data Generation 

Run by executing source("R/SyntheticData/SimulateDataset.R")

This script generates a synthetic dataset meant to represent a subset of the GPEHR (general practice electronic health record).
It prodcues two tables:

+ GPEHR_PRACTICE
  + This table contains a list of practices with randomly generated names
+ GPEHR_PATIENT_SUMMARY
  + This table randomly generates patients that attended each practice and samples demographic information such as age, sex, and number of encounters to the practice.

###  Data Processing

The data processing is split into two stages.

+ source("R/RunDataPrep.R")
  + This script contains all data manipulation tasks to produce new variables and tables that have multiple uses
+ source("R/PrepareCharts.R")
  + Produces a table for each chart in the report, with exactly the needed statistics and table structure to be loaded in the PracticeReportsCharts pipeline
