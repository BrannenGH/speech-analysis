###################################
# By Brannen Hall
# This is intended to be a library of abstractions for dealing with sound files in R
###################################

###################################
# WARNING: A Fortran compiler is needed for the proper installation of tuneR
###################################

if (!(require("tuneR"))){
  print("A Fortran complier is need for thee proper installation of tuneR. If one is not installed in a way that it can be found, the installation will fail")
  install.packages("tuneR")
}
if (!(require("signal"))){
  print("A Fortran complier is need for thee proper installation of signal. If one is not installed in a way that it can be found, the installation will fail")
  install.packages("signal")
}
if (!(require("plotrix"))){
  install.packages("plotrix")
}

library("tuneR")
library("signal")
library("plotrix")
library("tools")

#loadWave <- function() {
#  relative_file_name <- readline(prompt="Enter a file location: ")
#  parsed_relative_file_name <- paste("\"", gsub("'","",relative_file_name), "\"", sep="")
#   file_name <- paste(system2(paste("/bin/bash", "|", "realpath", parsed_relative_file_name), stdout=TRUE), sep="", collape="")
# For some reason, the file.choose() function will only accept absolute locations, unix shorthand like "*" or ".." will not work
#  return(readWave(file_name))
#}

#Will not work with Unix shorthand such as *, but will parse relative file locations.
loadWave <- function(unix_shorthand = FALSE) {
  file_name <- file.choose()
  if (unix_shorthand) {
    file_name <- system2(paste("realpath ", "\"", gsub("\'","",file_name), "\"", sep=""), stdout=TRUE)
  }
  return(readWave(file_path_as_absolute(gsub("\'","",file_name))))
}

# This only works for signal channel wave files at the moment, also I need to work on custom windows, this displays simply raw wave data points in a 3D space
displaySpectogram <- function(wave, channel="left") {
  return(specgram(eval(parse(text = (paste("wave@",channel,sep=""))))))
}

viewSpectum <- function(point, wave) {
  return(wave@left)
}



#returnPolarMatrix <- funciton(wave, channel="left"){
#    for i in 0:max(wave@channel)
