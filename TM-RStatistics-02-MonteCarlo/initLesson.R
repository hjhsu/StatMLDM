# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

assign("AAPL", 
       local({
         read.csv("TM-RStatistics-02-MonteCarlo/AAPL.csv")
       }), envir = globalenv())


