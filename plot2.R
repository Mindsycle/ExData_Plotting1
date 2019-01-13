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

# require lubridate and attempt to install if package is not loaded
# this package would allow easier work with dates
if(require("lubridate")){
  print("lubridate is loaded correctly")
} else {
  print("trying to install lubridate")
  install.packages("lubridate")
  if(require(lubridate)){
    print("lubridate installed and loaded")
  } else {
    stop("could not install lubridate")
  }
}


#read the text file
hpc <- read.csv.sql("~/Desktop/da/household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";",stringsAsFactors=FALSE)

#create new column with date and time as a single value
hpc$datetime <- with(hpc,dmy(hpc$Date)+hms(hpc$Time))


#prepare for generating the png file
png(filename="~/Desktop/ExData_Plotting1/plot2.png", 
    units="px", 
    width=480, 
    height=480,
    pointsize=8,
    res=150)

#plot2
plot(hpc$datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()




