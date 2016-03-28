# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

<<<<<<< HEAD
=======
assign("AAPL", 
       local({
         read.csv("TM-RStatistics-02-MonteCarlo/AAPL.csv")
       }), envir = globalenv())
>>>>>>> 9168863617f243afb04fda704daccbf9183e749b

.get_path <- function(fname) {
  normalizePath(file.path(find.package("swirl", quiet = TRUE), sprintf("Courses/StatMLDM/TM-RStatistics-02-MonteCarlo/%s", fname)), mustWork = TRUE)
}

assign("AAPL", 
       read.csv(.get_path("AAPL.csv")), 
       envir = globalenv())
