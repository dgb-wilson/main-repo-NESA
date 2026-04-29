con <- connectdb()

# create a reference table of age categories
ref_tencat_ages <- fCreateAgeGroups(cuts = seq(from = 10, to = 90, by = 10))

dbWriteTable(con,
             "REFERENCE_TENCAT_AGES",
             ref_tencat_ages,
             overwrite=TRUE)

# append age_category to GPEHR_PATIENT_SUMMARY table
dbExecute(con,read_file("SQL/DataPrep/Append_Age_Category.sql"))

disconnectdb(con)