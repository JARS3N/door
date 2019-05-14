
move_server<-function(){
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
    
    Map(function(x,y){
      file.copy(x,file.path(system.file("find",package="door"),y))
    },
    x=input$files$datapath,
    y=input$files$name)
    
  })
})
}
