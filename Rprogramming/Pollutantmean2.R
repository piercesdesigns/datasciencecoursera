pollutantmean2<- function(directory, pollutant, id = 1:332) {
  
  path = directory
  #get the file List in that directory
  ListFiles<- list.files(path,full.names=TRUE)
 
  Files2Process<- ListFiles[id]
  dat<-data.frame()
  Dat<-lapply(file.path(Files2Process),read.csv)
  Dat<-do.call(rbind.data.frame,Dat)
  mean(Dat[,pollutant],na.rm=TRUE)
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}