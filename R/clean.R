clean<-function(){
unlink(
  list.files(
    path=system.file(package='door','find'),
             full.names=T
  )
)
message('room cleaned')
}
