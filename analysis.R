###################################
# By Brannen Hall
# This is intended to be a library of abstractions for dealing with sound files in R
###################################

###################################
# WARNING: A Fortran compiler is needed for the proper installation of tuneR
###################################
require("tuneR")
require("signal")

loadWave <- function() {
  file_name <- file.choose()
# For some reason, the file.choose() function will only accept absolute locations, unix shorthand like "*" or ".." will not work
  return(readWave(file_name))
}

# This only works for signal channel wave files at the moment, also I need to work on custom windows, this displays simply raw wave data points in a 3D space
displaySpectogram <- function(wave, is_right=false) {
  if (is_right){
    return(specgram(wave@right))
  }
  else {
    return(specgram(wave@left))
  }
}

viewSpectum <- function(point, wave) {
  return(wave@left)
}
