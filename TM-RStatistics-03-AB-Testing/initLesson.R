# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

.get_path <- function(fname) {
  normalizePath(file.path(find.package("swirl", quiet = TRUE), sprintf("Courses/StatMLDM/TM-RStatistics-03-AB-Testing/%s", fname)), mustWork = TRUE)
}

assign("cricket_color",
       read.csv(.get_path("cricket_color.csv")),
       envir = globalenv())

assign("game",
       read.csv(.get_path("game.csv")),
       envir = globalenv())
