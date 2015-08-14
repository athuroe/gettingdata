---
title: "Instructions for the script run_analysis.R"
author: "Andreas Thuröe"
date: "Thursday, August 13, 2015"
output: html_document
---

##Introduction
The script run_analysis.R is used to clean up and summarize accelerometer and gyroscope data from the Samsung Galaxy S smartphone. The original dataset is called 'Human Activity Recognition Using Smartphones Dataset'. A full description of how the data was obtained is available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script is assuming that the raw data is available in your working directory. The data can be downloaded from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##How it works
run_analysis.R does the following:  
* Reads in the acceleromter raw data (distributed in test and train data)  
* Reads in other variables (subject, activity)  
* Merges test and train data into one dataframe  
* Extracts only the measurments that are mean and standard deviations  
* Adds and cleans up descriptive variable names  
* Creates a new dataframe with the average of each remaining variable for each activity and each subject  
