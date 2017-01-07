###################################
# By Brannen Hall
# This is intended to be a library of abstractions for dealing with sound files in R
###################################

###################################
# WARNING: A Fortran compiler is needed for the proper installation of tuneR
###################################

print("A FORTRAN COMPLIER IS NEEDED FOR THE INSTALLATION OF SIGNAL!")
for (package in c("tuneR", "signal", "stats", "plotrix")) {
  if (!(require(package, character.only = TRUE))){
    install.packages(package)
  }
  library(package, character.only = TRUE)
}

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
    file_name <- system2("realpath", args = paste("\"", gsub("\'","",file_name), "\"", sep=""), stdout=TRUE)
  }
  return(readWave(file_path_as_absolute(gsub("\'","",file_name))))
}

# This only works for signal channel wave files at the moment, also I need to work on custom windows, this displays simply raw wave data points in a 3D space
displaySpectogram <- function(wave, channel="left", window_size = 0.005) {
  return(specgram(eval(parse(text = (paste("wave@",channel,sep=""))))), n = window_size)
}

viewSpectum <- function(point, wave) {
  #Do Fourier analysis to get indiviudal points
  return(wave@left)
}



#returnPolarMatrix <- funciton(wave, channel="left"){
#    for i in 0:max(wave@channel)
