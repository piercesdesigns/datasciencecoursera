#
# |------------------------------------------------------------------------------------------|
# | I N T E R N A L F U N C T I O N S |
# |------------------------------------------------------------------------------------------|
corr <- function(directory, threshold = 0) {
  # --- Assert 'directory' is a character vector of length 1 indicating the
  # location of the CSV files.  'threshold' is a numeric vector of length 1
  # indicating the number of completely observed observations (on all
  # variables) required to compute the correlation between nitrate and
  # sulfate; the default is 0.  Return a numeric vector of correlations.
  
  # --- Assert create an empty numeric vector
  corrsNum <- numeric(0)
  path = directory
  # --- Assert get a data frame as ID = 1:332
  nobsDfr <- Complete(path)
  
  # --- Assert apply threshold
  nobsDfr <- nobsDfr[nobsDfr$nobs > threshold, ]
  
  for (cid in nobsDfr$id) {
    # ---Vector of file names
    ListFiles<- list.files(path,full.names=TRUE)
    #--Vector of data for file to be processed  
    monDfr <- read.csv(file.path(ListFiles[cid]))
    
    # --- Calculate correlation between $sulfate and $nitrate
    corrsNum <- c(corrsNum, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))
  }
  
  # --- Return value is a numeric vector of correlations
  return(corrsNum)
}

  