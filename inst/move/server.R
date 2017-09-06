library(dplyr)
library(shiny)
ENVS<-Sys.getenv()
if(.Platform$OS.type=="unix"){
 cmp<<-system("hostname")
  nms<<-ENVS[["LOGNAME"]]
  }else{
cmp<<-ENVS[["COMPUTERNAME"]]
  nms<<-ENVS[["USERNAME"]]
  }
shinyServer(function(input, output,session) {
  output$nm<-renderText(nms)
  output$cmp<-renderText(cmp)
  session$onSessionEnded(function() {
    stopApp()
  })

  observeEvent(input$files,{
      group_by(input$files,name) %>%
      (function(u){
        file.copy(u$datapath,file.path(system.file("find",package="door"),u$name))
      })
  })
})
