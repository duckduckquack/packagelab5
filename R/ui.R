ui <- shiny::fluidPage(

  #title
  shiny::headerPanel("Ekologiskt odlad \u00e5kermark, andel (\u0025)"),

  #sidebar
  shiny::sidebarPanel(
    #sidebar title
    shiny::titlePanel("Input parameters"),

    #choices for dropdown menu
    shiny::selectInput("city", label = "City in \u00d6sterg\u00f6tland:",
                       choices = as.list(setNames(c("Boxholm", "Finsp\u00e5ng", "Kinda", "Link\u00f6ping", "Mj\u00f6lby",
                                                    "Motala", "Norrk\u00f6ping", "S\u00f6derk\u00f6ping", "Vadstena",
                                                    "Valdemarsvik", "Ydre", "\u00c5tvidaberg", "\u00d6desh\u00f6g"),
                                                  c("Boxholm", "Finsp\u00e5ng", "Kinda", "Link\u00f6ping", "Mj\u00f6lby",
                                                    "Motala", "Norrk\u00f6ping", "S\u00f6derk\u00f6ping", "Vadstena",
                                                    "Valdemarsvik", "Ydre", "\u00c5tvidaberg", "\u00d6desh\u00f6g"))
                       ),
                       selected = "Link\u00f6ping")
  ),

  #create mainpanel to accomodate the plot
  shiny::mainPanel(
    shiny::plotOutput(outputId = "linePlot")
  )
)
