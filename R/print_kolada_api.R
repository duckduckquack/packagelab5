#' print.kolada_api
#' Print method for s3 objects of class kolada_api
#'
#' @param x an object of class kolada_api
#' @param ... other possible parameters
#'
#' @return a string which gets printed out
#' @export
#'
#' @examples
#' k_api <- kolada_api("http://api.kolada.se/v2/municipality?title=ale")
#' print(k_api)
print.kolada_api <- function(x, ...){

  ####Generic for class kolada_api
  cat("<Kolada API>", "\n")
  cat("url: ", x$url, "\n")
  cat("n_pages: ", x$n_pages, "\n")
  cat("count: ", x$count, "\n")
  cat("The data frame of values has the following cols: ", "\n")
  cat(names(x$values))
}


