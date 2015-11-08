# Exploratory Data Analysis: Course Project #1
# Plot 2 R Script:

## Read in the full dataset from Working Directory:
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Need to read in "Date" column as a date to sub-set later:
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Sub-set the data to only use the dates specified in project:
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
          rm(data_full)

          
## Read in new date columns as Date-formatted variables:
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Code to create Plot 2:
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot 2 to a PNG file within Working Directory:
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

### END
