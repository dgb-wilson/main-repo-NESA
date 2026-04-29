# function to disconnect from the database
disconnectdb <- function(db){
  dbDisconnect(db, shutdown=T)
}

# function to connect to the database
connectdb <- function(){
  dbcon <- DBI::dbConnect(
    duckdb::duckdb(),
    "Data/PracticeReportData.duckdb"
  )
  
  
  return(dbcon)
}

fCreateAgeGroups <- function(cuts){
  lowgroups <- c(0, cuts)
  highgroups <- c(cuts, 2500)
  text <- paste0(lowgroups, "-", highgroups - 1)
  text[length(highgroups)] <- paste0(highgroups[length(highgroups)-1], "+")
  
  out <- data.frame(agecat = 0:(length(highgroups) - 1),
                    age_low = lowgroups,
                    age_high = highgroups,
                    agecat_text = text)
  
  return(out)
}

# A function for executing several SQL scripts in sequence
fRunScripts <- function(db=con, scripts, location="SQL"){
  
  lapply(scripts, function(script){ 
    DBI::dbExecute(db, read_file(file.path(location, script)))
  })
}