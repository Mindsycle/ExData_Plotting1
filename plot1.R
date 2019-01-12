# require sqldf and attempt to install if package is not loaded
# this package would allow to filter data on reading the csv file
if(require("sqldf")){
  print("sqldf is loaded correctly")
} else {
  print("trying to install sqldf")
  install.packages("sqldf")
  if(require(sqldf)){
    print("sqldf installed and loaded")
  } else {
    stop("could not install sqldf")
  }
}

#read the text file
hpc <- read.csv.sql("~/Desktop/Data Exploration with R/household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";",stringsAsFactors=FALSE)







