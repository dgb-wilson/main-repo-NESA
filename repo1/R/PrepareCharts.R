con <- connectdb()

# create charts for Age and Sex Distribution
fRunScripts(con,
            scripts = c("AgeSexDistribution.sql",
                        "AgeSexDistribution_PHN.sql",
                        "AgeSexDistribution_NSW.sql"),
            location = 'SQL/Charts')

disconnectdb(con)