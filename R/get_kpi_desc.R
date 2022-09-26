#' get_kpi_desc
#' Given a kpi title it returns a short description related to the kpi
#'
#' @param kpi a string
#'
#' @return a string
#' @export
#' @examples
#' get_kpi_desc("Ekologiskt odlad \u00e5kermark, andel (%)")
get_kpi_desc <- function(kpi){
  ####Returns the kpi description given a kpi title

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

  #get description
  ##NB some kpis encapsulate other kpis so their description is actually a vector of desc,
  ##where the desc corresponds to the desc of the other kpis encapsulated. For example the title
  ##-Residents with obesity- returns the desc of this kpi itself but also the desc
  ##of kpi -Residents of age between 25 and 75 with obesity-. Therefore, we need to
  ##make an additional check of the title
  ##NB2 the system also allows for partial matches. For example "inver" returns all the
  ##Kpis that contain "inver" in the title. However, to get a unique result
  ##we are not going to allow this
  desc <- values$description[tolower(values$title) == tolower(kpi)]

  if (length(desc) == 0){
    stop("Kpi title does not exist")
  }

  desc
}
