options(repos = c(CRAN = "https://cloud.r-project.org"))

if (interactive() || isatty(stdout())) {
  options(width = 150)
  if (require("colorout", quietly = FALSE)) {
    colorout::setOutputColors(
      index = 8, # gray
      normal = 7, # text

      number = 4, # blue
      negnum = 16, # orange
      zero = 6, zero.limit = 1, # light blue
      infinite = 5, # pink

      string = 3, # yellow
      date = 7, # text
      const = 16, # orange,

      true = 2, # green
      false = 1, # red

      warn = 16, # orange
      stderror = 1, # red
      error = 1, # red

      verbose = FALSE
    )
  }
}
