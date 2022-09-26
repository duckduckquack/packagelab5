server <- function(input, output) {
  output$linePlot <- shiny::renderPlot({
    #get the data from the API
    data <- get_data(kpi_id = "N00403", year = "2010,2011,2012,2013,2014,2015,2016,2017",
                     city_id = get_city_id(input$city))

    #create the plot
    x <- data$period
    y <- data$values
    ggplot2::ggplot(data) +
      ggplot2::geom_line(ggplot2::aes(x = x, y = y)) +
      ggplot2::scale_x_continuous(breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017)) +
      ggplot2::labs(x = "Years", y = "Ekologiskt odlad \u00e5kermark, andel (%)")
  })
}
