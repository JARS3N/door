clean<-function(){
system.file(package='door','find') %>% 
list.files(full.names=T) %>%
unlink()
message('room cleaned')
}
