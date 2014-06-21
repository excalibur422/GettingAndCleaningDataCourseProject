First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Make sure the folder with the train and test, activity, feature files, etc are all in the current working directory along with run_analysis.R script,

Second, use source("run_analysis.R") command in RStudio.

Third, you will find two output files are generated in the current working directory:
combined_data.txt  and tidydata.txt it contains a data frame with the final result. 

The final output will have 180 rows since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total.
