f.word_count=function(str){
  library(stringr)
  return(str_count(str, '\\w+'))
}