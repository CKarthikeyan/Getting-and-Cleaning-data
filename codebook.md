This file describes how the code in the run_analysis file works.  

More information about the experiment can be obtained from   
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was downloaded from the following URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
The run_analysis.R script does the following in order to come up with tidy data 
i. Data is read from X_train.txt, y_train.txt and subject_train.txt in the "./UCI HAR Dataset/train" folder and stored in x_train, y_train and subject_train variables 
 respectively. 
ii.Data is read from features.txt file in the "/UCI HAR Dataset" folder and it is stored in a variable called features. Only names of the columns are extracted. Names  
are assigned to columns in the data frames x_train, y_train and subject_train. Data is read from activity_labels.txt file in the "/UCI HAR Dataset" folder and it is  
stored in a variable called activity. 
iii.Data is read from X_test.txt, y_test.txt and subject_test.txt in the "./UCI HAR Dataset/test" folder and stored in x_test, y_test and subject_test variables  respectively. 
iv. Names are assigned to columns in the data frames x_test, y_test and subject_test. v. Column bind the datasets subject_train, y_train and y_train in that order to create a dataset. Similarly for test data. Row binds the two datasets creating the consolidated_total data frame. The data frame has 10299 rows and 563 columns. 
vi. Extracts the subject, activity, mean() and std() column data in consolidated_total separately. Column binds the extracted data to allcolumnames data frame. The data frame has a 10299 rows and 68 columns. 
vii. Groups the data frame based on the subject and activity into the groupeddata data frame. This data frame has 180 rows and 68 columns. 
viii. Recodes the values of activity in groupeddata to corresponding values in activity data frame. 
ix. Writes groupeddata data frame to output.txt file in the current working directory. 
