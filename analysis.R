###################################
# By Brannen Hall
# This is intended to be a library of abstractions for dealing with sound files in R
###################################

Wave <- loadWav()
  file_name <- file.choose()
  return readWave(file_name)
  
