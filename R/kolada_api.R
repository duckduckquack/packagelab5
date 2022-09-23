kolada_api <- function(url){
  ####Given the url for a Kolada API call it returns an S3 object of class kolada_api.
  
  ####The class kolada_api has the following fields:
  ####values --> data frame returned by call to api (including the next pages if any)
  ####url --> the url used to call the api (only of the first page if more than one)
  ####n_pages --> the number of pages we needed to parse to get the full data frame
  ####count --> the length of values
  
  #check if url is a string
  stopifnot(is.character(url)) 
  
  #call API
  res <- httr::GET(url)
  
  #check that API did not return an error
  if (res$status_code != 200){
    stop("Call to API did not go through. Try again later.")
  }
  #check the type returned is as expected
  if (httr::http_type(res) != "application/json"){
    stop("API did not return json")
  }
  
  #parse content
  parsed <- jsonlite::fromJSON(httr::content(res, "text"))
  values <- parsed$values
  
  #get next_page url
  next_page <- parsed$"next_page"
  
  #keep track of number of pages
  n_pages <- 1
  
  #initialize count
  count <- 0
  
   while (!is.null(next_page)) {
     new_res <- httr::GET(next_page)
     #check that API did not return an error
     if (new_res$status_code != 200){
       stop("Call to API did not go through. Try again later.")
     }
     #check the type returned is as expected
     if (httr::http_type(new_res) != "application/json"){
       stop("API did not return json")
     }
     new_parsed <- jsonlite::fromJSON(httr::content(new_res, "text"))
     new_values <- new_parsed$values
     values <- rbind(values, new_values)
     next_page <- new_parsed$"next_page"
     n_pages <- n_pages + 1
   }
  
  #get the count
  if (!is.null(nrow(values))){
    count <- nrow(values)
  }
  
  #create S3 wrapper
  structure(
    list(
      values = values, 
      url = url,
      n_pages = n_pages,
      count = count
    ),
    class = "kolada_api"
  )
}


print.kolada_api <- function(x, ...){
  ####Generic for class kolada_api
  cat("<Kolada API>", "\n")
  cat("url: ", x$url, "\n")
  cat("n_pages: ", x$n_pages, "\n")
  cat("count: ", x$count, "\n")
  cat("The data frame of values has the following cols: ", "\n")
  cat(names(x$values))
}









