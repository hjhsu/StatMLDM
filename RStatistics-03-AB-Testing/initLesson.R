# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

assign("cricket_color",
       read.csv(.get_path("cricket_color.csv")),
       envir = globalenv())

assign("game",
       read.csv(.get_path("game.csv")),
       envir = globalenv())
