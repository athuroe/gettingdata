---
title: "Instructions for the script run_analysis.R"
author: "Andreas Thuröe"
date: "Thursday, August 13, 2015"
---

##Introduction
The script run_analysis.R is used to clean up and summarize accelerometer and gyroscope data from the Samsung Galaxy S smartphone. The original dataset is called 'Human Activity Recognition Using Smartphones Dataset'. 

##Input - original "raw" dataset
A full description of how the data was obtained is available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script is assuming that the raw data is already downloaded, extracted and available in your working directory. The data can be downloaded from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Output
The output of the script is a tidy dataset including the AVERAGE of the MEAN and STANDARD DEVIATION measurements per subject and activity

##Instructions
run_analysis.R does the following:  
1. Download data from link above and extract it into your R working directory (Keep the internal file structure of the downloaded package.)
2. Run the script "run_analysis.R"
3. The resulting dataframe is stored in a file called "tidy_data.txt"