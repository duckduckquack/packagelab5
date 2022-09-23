get_city_id <- function(city){
  ####Returns the municipality id given a city. 
  
  #check if city is a string
  stopifnot(is.character(city))
  
  #create url by adding the query
  url <- httr::modify_url("http://api.kolada.se/v2/municipality", query=list(title = city))
  
  #get s3 object of class kolada_api
  s <- kolada_api(url)
  
  #in case the municipality does not exist return an error
  if (s$count == 0) {
    stop("Municipality name does not exist")
  }
  
  #get the values
  values <- s$values
  
  #return id corresponding to the municipality
  ##NB big municipalities have two ids: one for the municipality itself 
  ##and one for the county council, we want to extract the id for the municipality only
  ##NB2 the system also allows for partial matches. For example "stock" returns all the 
  ##municipalities that contain "stock" in their name. However, to get a unique result
  ##we are not going to allow for this and return "Municipality does not exist" for "stock"
  id <- values[(values$type == "K" & tolower(values$title) == tolower(city)), ]$id
  
  if (length(id) == 0){
    stop("Municipality name does not exist")
  }
  
  id
}