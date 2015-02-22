# Getting-and-Cleaning-data
The data zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip will have to be extracted into the current working directory. 

The run analysis code looks at the folder structure from the current working directory. 

Use source("run_analysis.R") command in RStudio.  

The code reads through the files in the train and test folders leaving out the inertial signals folders and creates a consolidated data frame. The features and activity label files are used to appropriately name the columns and the activities. An output.txt file will be created in the current working directory. This file contains a data frame of 180*68 dimensions giving averages across different subjects broken down by activity.

