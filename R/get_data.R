#' get_data
#' Given a kpi id, year and city id it returns the corresponding data.
#' @param kpi_id a string
#' @param year a string
#' @param city_id a string
#'
#' @return a data frame
#' @export
#'
#' @examples
#' get_data(kpi_id = "N00403", year = "2019,2020", city_id = "0580")
get_data <- function(kpi_id = "", year = "", city_id = ""){
  ####Given a kpi_id, year and city returns the corresponding data

  ###NB year can also include multiple elements as long as they are
  ####separated by a comma with no spaces, eg 2009,2010,2020, 0580,0581

  ####The output data is of the following form: kpi municipalitu period values

  #check if inputs are of type string
  stopifnot(is.character(kpi_id))
  stopifnot(is.character(year))
  stopifnot(is.character(city_id))

  #check whether user did not give any input
  if ((kpi_id == "" & year == "" & city_id == "")){
    stop("Please provide some inputs!")
  }

  #create url by pasting
  t <- paste0("http://api.kolada.se/v2/data/",
                #add kpi_id if not empty
                if(kpi_id != "") { paste0("kpi/", kpi_id, "/")},
                #add municipality if not empty
                if(city_id != "") { paste0("municipality/", city_id, "/")},
                #add year if not empty
                if(year != "") { paste0("year/", year, "/")}
                )
  url <- substr(t, 1, nchar(t)-1)

  #get s3 object of class kolada_api
  s <- kolada_api(url)

  #extract the values
  df <- s$values

  #we want the values for all the genders (we do not want to divide result by gender)
  df$values <- sapply(df$values, function(x){x[x$gender == "T", 4]})
  df
}













