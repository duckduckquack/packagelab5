get_kpi_id <- function(kpi){
  ####Returns the kpi id given a kpi title
  
  #check if kpi is a string
  stopifnot(is.character(kpi))
  
  #create url by adding the query
  url <- httr::modify_url("http://api.kolada.se/v2/kpi", query=list(title = kpi))
  
  #get S3 object of class kolada_api
  s <- kolada_api(url)
  
  #in case the kpi title does not exist return an error
  if (s$count == 0) {
    stop("Kpi title does not exist")
  }
  
  #get the values
  values <- s$values
  
  #return id corresponding to kpi title
  ##NB some kpis encapsulate other kpis so their id is actually a vector of codes, 
  ##where the codes corresponds to the other kpis encapsulated. For example the kpi 
  ##-Residents with obesity- returns the code of this kpi itself but also the code 
  ##of kpi -Residents of age between 25 and 75 with obesity-. Therefore, we need to
  ##make an additional check of the title
  ##NB2 the system also allows for partial matches. For example "inver" returns all the 
  ##kpi titles that contain "inver" in their title However, to get a unique result
  ##we are not going to allow this
  id <- values$id[tolower(values$title) == tolower(kpi)]
  
  if (length(id) == 0){
    stop("Kpi title does not exist")
  }
  
  id
}
