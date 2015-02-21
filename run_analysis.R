## Load the library dplyr
library(dplyr)

## Read the text files in the UCI HAR Dataset/train folder in the current working directory, excluding the inertial signals folder

subject_train <- read.table(paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt",sep=""))
y_train <- read.table(paste(getwd(),"/UCI HAR Dataset/train/Y_train.txt",sep=""))
x_train <- read.table(paste(getwd(),"/UCI HAR Dataset/train/X_train.txt",sep=""))

## Read the column names for the X data from the features file and assign them to the X data frames created above
## Assign column names for other columns

features <- read.table(paste(getwd(),"/UCI HAR Dataset/features.txt",sep=""))
onlyfeatures <- features[,2]
names(subject_train) <- c("subject")
names(y_train) <- c("activity")
names(x_train) <- onlyfeatures
activity_labels <- read.table(paste(getwd(),"/UCI HAR Dataset/activity_labels.txt",sep=""))

## Read the text files in the UCI HAR Dataset/test folder in the current working directory, excluding the inertial signals folder

subject_test <- read.table(paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt",sep=""))
y_test <- read.table(paste(getwd(),"/UCI HAR Dataset/test/Y_test.txt",sep=""))
x_test <- read.table(paste(getwd(),"/UCI HAR Dataset/test/X_test.txt",sep=""))

## Assign column names to the different data frames created
names(subject_test) <- c("subject")
names(x_test) <- onlyfeatures
names(y_test) <- c("activity")

## Create a consolidated data frame from the previously created data frames

consolidated_test <- cbind(subject_test,y_test,x_test)
consolidated_train <- cbind(subject_train,y_train,x_train)
consolidated_total <- rbind(consolidated_test,consolidated_train)
firstcolumns <- consolidated_total[c("subject","activity")]

## Fetch only the columns that are mean or std deviations and create a data frame of these

newmean <- consolidated_total[grep("-mean\\(\\)",names(consolidated_total))]
newstd <- consolidated_total[grep("-std\\(\\)",names(consolidated_total))]
allcolumnames <- firstcolumns
allcolumnames <- cbind(allcolumnames,newmean)
allcolumnames <- cbind(allcolumnames,newstd)
paste("Total rows in data ", nrow(allcolumnames), sep="")
paste("Total Columns in data ", ncol(allcolumnames), sep="")
groupeddata <- allcolumnames %>% group_by(subject,activity) %>% summarise_each(funs(mean))
groupeddata$activity <- activity_labels[match(groupeddata$activity, activity_labels[,1]),2]
paste("Total rows in grouped data ", nrow(groupeddata ), sep="")
paste("Total Columns in grouped data ", ncol(groupeddata), sep="")

## Write the grouped data to a text file

write.table(groupeddata ,file="output.txt",append=FALSE,row.name=FALSE)

