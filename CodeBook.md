---
title: "CodeBook"
author: "Andreas Thuröe"
date: "Friday, August 14, 2015"
output: html_document
---
##Variables
###activity (Character)

* walking
* walking_upstairs
* walking_downstairs
* sitting
* standing
* laying

Each person performed six activities wearing the smartphone Samsung Galaxy S II on the waist.

###subject (Integer)

* 1..30

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.

###measurements (Numeric)
* "tBodyAccMeanX"
* "tBodyAccMeanY"           
* "tBodyAccMeanZ"
* "tGravityAccMeanX"        
* "tGravityAccMeanY"
* "tGravityAccMeanZ"        
* "tBodyAccJerkMeanX"
* "tBodyAccJerkMeanY"       
* "tBodyAccJerkMeanZ"
* "tBodyGyroMeanX"          
* "tBodyGyroMeanY"
* "tBodyGyroMeanZ"          
* "tBodyGyroJerkMeanX"
* "tBodyGyroJerkMeanY"      
* "tBodyGyroJerkMeanZ"
* "tBodyAccMagMean"         
* "tGravityAccMagMean"
* "tBodyAccJerkMagMean"     
* "tBodyGyroMagMean"
* "tBodyGyroJerkMagMean"    
* "fBodyAccMeanX"
* "fBodyAccMeanY"           
* "fBodyAccMeanZ"
* "fBodyAccJerkMeanX"       
* "fBodyAccJerkMeanY"
* "fBodyAccJerkMeanZ"       
* "fBodyGyroMeanX"
* "fBodyGyroMeanY"          
* "fBodyGyroMeanZ"
* "fBodyAccMagMean"         
* "fBodyBodyAccJerkMagMean"
* "fBodyBodyGyroMagMean"    
* "fBodyBodyGyroJerkMagMean"
* "tBodyAccStdX"            
* "tBodyAccStdY"
* "tBodyAccStdZ"            
* "tGravityAccStdX"
* "tGravityAccStdY"         
* "tGravityAccStdZ"
* "tBodyAccJerkStdX"        
* "tBodyAccJerkStdY"
* "tBodyAccJerkStdZ"        
* "tBodyGyroStdX"
* "tBodyGyroStdY"           
* "tBodyGyroStdZ"
* "tBodyGyroJerkStdX"       
* "tBodyGyroJerkStdY"
* "tBodyGyroJerkStdZ"       
* "tBodyAccMagStd"
* "tGravityAccMagStd"       
* "tBodyAccJerkMagStd"
* "tBodyGyroMagStd"         
* "tBodyGyroJerkMagStd"
* "fBodyAccStdX"            
* "fBodyAccStdY"
* "fBodyAccStdZ"            
* "fBodyAccJerkStdX"
* "fBodyAccJerkStdY"        
* "fBodyAccJerkStdZ"
* "fBodyGyroStdX"           
* "fBodyGyroStdY"
* "fBodyGyroStdZ"           
* "fBodyAccMagStd"
* "fBodyBodyAccJerkMagStd"  
* "fBodyBodyGyroMagStd"
* "fBodyBodyGyroJerkMagStd"

This is a subset of the original dataset measurements containing only the measurements of the Mean and the Standard Deviation of each measurement. Each measurement is in a separate column. Names have been cleaned (removed parentheses and dashes) for more efficient handling in R. Please refer to 'features_info.txt' in the original dataset for more detailed information on the measurements.


##Study Design
The cleaned up data that is produced by the script "run_analysis.R" is created through the following steps.

###What the script does - Step by step
1. Read in all files into memory using read.table and these parameters
        + all: header=F, fill=T
        + activities and features: stringsAsFactors = F        
2. Subject, activity and measurement data is stiched together using 'cbind' 
3. Column names are put in place and, if necessary, cleaned up
4. The measurements divided into "test" and "train" are merged into one data frame using 'rbind'
5. The mean and std measurements are extracted using subsetting by '[]' together with the 'grepl' looking for the patterns "mean()" and "std()"
6. The activity ID (int) is replaced by descriptive activity names, using 'merge'
7. The column names of the measurements are cleaned up from ".", "()" and "-" for easier reading and better handling by R commands
8. A new data frame is created with the average measurement per activity and subject using the 'group_by' and 'summarise_each' commands combined into one line using the '%>%' operator

The original dataset that is the basis for this data can be downloaded here: 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'. For details on how the original data was obtained please refer to the 'readme.txt' in the original data folder.

