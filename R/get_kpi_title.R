get_kpi_title <- function(kpi_id){
  ####Returns the kpi title given the kpi id
  
  #check if kpi_id is a string
  stopifnot(is.character(kpi_id))
  
  #create url by pasting
  url <- paste0("http://api.kolada.se/v2/kpi/", kpi_id)
  
  #get S3 object of class kolada_api
  s <- kolada_api(url)
  
  #in case the kpi id does not exist return an error
  if (s$count == 0) {
    stop("Kpi title does not exist")
  }
  
  #get the values
  values <- s$values
  
  ##NB some kpis encapsulate other kpis so their id is actually a vector of ids, 
  ##where the id corresponds to the other kpis encapsulated. For example the kpi 
  ##-Residents with obesity- returns the id of this kpi itself but also the id 
  ##of kpi -Residents of age between 25 and 75 with obesity-. Therefore, we need to
  ##make an additional check of the id.
  ##NB2 the system also allows for partial matches. For example "6" returns all the 
  ##kpi ids that contain "6" in their id. However, to get a unique result
  ##we are not going to allow this
  title <- values$title[tolower(values$id) == tolower(kpi_id)]
  
  if (length(title) == 0){
    stop("Kpi id does not exist")
  }
  
  title
}