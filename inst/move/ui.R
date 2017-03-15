library(shiny)

shinyUI(fluidPage(
  titlePanel(h4('File Transfer')),
  mainPanel(
    fileInput("files", "File data", multiple=TRUE),
    fluidRow(width="50%",
             column(width=2,p("User:")),
             column(width=2,textOutput('nm'))
    ),
    fluidRow(width="100%",
             column(width=2,p("Machine:")),
             column(width=2,textOutput('cmp'))
    )
  )
))
