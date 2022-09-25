print.kolada_api <- function(x, ...){

  ####Generic for class kolada_api
  cat("<Kolada API>", "\n")
  cat("url: ", x$url, "\n")
  cat("n_pages: ", x$n_pages, "\n")
  cat("count: ", x$count, "\n")
  cat("The data frame of values has the following cols: ", "\n")
  cat(names(x$values))
}


