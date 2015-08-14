
##Read in data, assuming the files are in the working directory
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F, fill=T)
X_test <- read.table('UCI HAR Dataset/test/X_test.txt', header=F, fill=T)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt', header=F, fill=T)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F, fill=T)
X_train <- read.table('UCI HAR Dataset/train/X_train.txt', header=F, fill=T)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt', header=F, fill=T)
activities <- read.table('UCI HAR Dataset/activity_labels.txt', header=F, fill=T, stringsAsFactors = F)
features <- read.table("UCI HAR Dataset/features.txt", header=F, fill=T, stringsAsFactors = F)

##Insert column names for activities
names(activities) <- c("activity_id", "activity")
activities$activity <- tolower(activities$activity)

##Insert column names for test and train data
names(X_test) <- features[,2]
names(X_train) <- features[,2]
                      
##Insert column names for subject
names(subject_test) <- "subject" 
names(subject_train) <- "subject"

##Insert column name for activity ID
names(y_test) <- "activity_id"
names(y_train) <- "activity_id"

##Stich together activity and measurement data
test_all <- cbind(y_test, X_test)
train_all <- cbind(y_train, X_train)

##Stich togehter subject and measurement data
test_all <- cbind(subject_test, test_all)
train_all <- cbind(subject_train, train_all)

##Merge test and train data
merged <- rbind(test_all, train_all)

##Extract mean and std values
merged_mean <- merged[,grepl("mean()", colnames(merged), fixed=TRUE)]
merged_std <- merged[,grepl("std()", colnames(merged), fixed=TRUE)]

##Create table with only the mean and std data together with the other variables (activity & subject)
merged_all <- cbind(merged[,1:2], merged_mean)
merged_all <- cbind(merged_all, merged_std)

##Merge descriptive activity names into data
merged_all <- merge(activities, merged_all)
merged_all$activity_id <- NULL

##Clean up variable names
names(merged_all) <- gsub("()", "", names(merged_all), fixed = TRUE)
names(merged_all) <- gsub(".", "", names(merged_all), fixed = TRUE)
names(merged_all) <- gsub("-", "", names(merged_all), fixed = TRUE)
names(merged_all) <- gsub("mean", "Mean", names(merged_all), fixed = TRUE)
names(merged_all) <- gsub("std", "Std", names(merged_all), fixed = TRUE)

##Create new data frame with the average of each variable for each activity and each subject
library(dplyr)
merged_summary <- merged_all %>% group_by(activity, subject) %>% summarise_each(funs(mean))
