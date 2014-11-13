library(data.table)

##############################################################################
# The purpose of this project is to demonstrate your ability to collect, 
# work with, and clean a data set. The goal is to prepare tidy data that 
# can be used for later analysis. You will be graded by your peers on a 
# series of yes/no questions related to the project. You will be required to 
# submit: 
#     1) a tidy data set as described below, 
#     2) a link to a Github repository with your script for performing the analysis, and 
#     3) a code book that describes the variables, the data, and any transformations 
#     or work that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. This repo 
# explains how all of the scripts work and how they are connected.

## You should create one R script called run_analysis.R that does the following.

## Merges the training and the test sets to create one data set

## Extracts only the measurements on the mean and standard deviation for each measurement.

## Uses descriptive activity names to name the activities in the data set

## Appropriately labels the data set with descriptive variable names.

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## get to the working directory
setwd(".\\github\\tidy_data")

######################################################################
### do this only once!! I've already done it, so don't do it again!!
#if (!file.exists(".\\data")){
#     dir.create(".\\data")
#}
# 
### the source data set is located here. unzip into the .\data folder
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = ".\\data\\dataset.zip", mode = "wb")
## the file describing the data is found here
# browseURL("http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones")

## the reference for the data is
## Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
## Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
## using a Multiclass Hardware-Friendly Support Vector Machine. International 
## Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## The steps for creating the data set are as follows:
# 1) Merges the training and the test sets to create one data set.

# read the training set...
dt_training = read.table(".\\data\\train\\X_train.txt")

# read the test set...
dt_test = read.table(".\\data\\test\\X_test.txt") 

# create combined set
dt_combined = rbind(dt_training, dt_test)

# free some memory
rm(dt_training)
rm(dt_test)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# let's use the features.txt file to apply names to the columns. The names in 
# features.text indicate mean, std, and other values. This step actually performs 
# step 4 below, in which we label the data set with descriptive variable names
dt_names=read.table(".\\data\\features.txt")
names(dt_combined) = dt_names[,2]

# now get only columns with mean or std in the name
targetCols = grep("-mean()|-std()", dt_names$V2)
dt_extracted = dt_combined[,targetCols]

# remove the meanFreq columns - I reason that since there is no corresponding
# stdFreq columns, these measures are fundamentally different from those
# demarked as mean() and std()
dt_extracted = dt_extracted[,which(!grepl("meanFreq()", colnames(dt_extracted))) ]
# cleanup data no longer needed
rm(dt_names)
rm(dt_combined)

# 3) Uses descriptive activity names to name the activities in the data set
# read the training activities
dt_training_activities = read.table(".\\data\\train\\y_train.txt")
# read the test activities
dt_test_activities = read.table(".\\data\\test\\y_test.txt")
# combine the two
dt_combined_activities = rbind(dt_training_activities, dt_test_activities)

# substitute values, don't merge. Merge will reorder the values, and we want 
# to preserve order so we can add this column to the rest of the data
# from activity_labels.txt
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
dt_combined_activities$V1[dt_combined_activities$V1==1] = "WALKING"
dt_combined_activities$V1[dt_combined_activities$V1==2] = "WALKING_UPSTAIRS"
dt_combined_activities$V1[dt_combined_activities$V1==3] = "WALKING_DOWNSTAIRS"
dt_combined_activities$V1[dt_combined_activities$V1==4] = "SITTING"
dt_combined_activities$V1[dt_combined_activities$V1==5] = "STANDING"
dt_combined_activities$V1[dt_combined_activities$V1==6] = "LAYING"
names(dt_combined_activities) = "Activity"
# add the activity labels to the dataset
dt_extracted = cbind(dt_combined_activities, dt_extracted)

# cleanup data no longer needed
rm(dt_training_activities)
rm(dt_test_activities)
rm(dt_combined_activities)

# 4) Appropriately labels the data set with descriptive variable names. 
# this was done in step 2 in this line - names(dt_combined) = dt_names[,2]

# 5) From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# get the subject numbers
# read the training activities
dt_training_subs = read.table(".\\data\\train\\subject_train.txt")
# read the test activities
dt_test_subs = read.table(".\\data\\test\\subject_test.txt")
# combine the two
dt_combined_subs = rbind(dt_training_subs, dt_test_subs)
names(dt_combined_subs) = "Subject"

# add the subject labels to the dataset
dt_extracted = cbind(dt_combined_subs, dt_extracted)

# The aggregate function will create the average of each variable
#for each activity and each subject
aggdata <-aggregate( . ~ Subject + Activity, data =dt_extracted, FUN=mean)
write.csv(aggdata, "ActivityMeans.csv", row.names=FALSE)

# cleanup data no longer needed
rm(dt_training_subs)
rm(dt_test_subs)
rm(dt_combined_subs)
rm(dt_extracted)