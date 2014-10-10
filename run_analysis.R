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
setwd("c:\\github\\tidy_data")

######################################################################
### do this only once!! I've already done it, so don't do it again!!
# if (!file.exists(".\\data")){
#     dir.create(".\\data")
# }
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
