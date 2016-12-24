###################################
# By Brannen Hall
# This is intended to be a library of abstractions for dealing with sound files in R
###################################

###################################
# WARNING: A Fortran compiler is needed for the proper installation of tuneR
###################################
require("tuneR") 


Wave <- loadWav() {
  file_name <- file.choose()
  return(readWave(file_name))
}
