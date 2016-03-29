# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

.get_path <- function(fname) {
  normalizePath(file.path(get_swirl_option("courses_dir"), sprintf("StatMLDM/TM-RStatistics-02-MonteCarlo/%s", fname)), mustWork = TRUE)
}

assign("AAPL", 
       read.csv(.get_path("AAPL.csv")), 
       envir = globalenv())
