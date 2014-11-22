# Files used for the tidy_data project:

run_analysis.R - main script file

codebook.md - explanation of variables in the output

README.md - this file


## Details:

**run_analysis.R**
run_analysis.R is the main script file used in this project. The file performs the following functions:

- Merges the training and the test sets to create one data set

- Extracts only the measurements on the mean and standard deviation for each measurement.

- Uses descriptive activity names to name the activities in the data set

- Appropriately labels the data set with descriptive variable names.

- Creates a second, independent tidy data set with the average of each variable for each activity and each subject

Source data files and folders must be placed in the working directory for the script to function properly.

Each step is described below:

*Merge the training and the test sets to create one data set*

The training and test sets are read from the working directory and combined into a single data table named dt_combined

*Extract only the measurements on the mean and standard deviation for each measurement*

In order to accomplish this step, we must know the names of the columns of the source data. The features.txt file contains the original names of the columns. We read the features. txt file from the working directory into a vector and use this vector to create the column names for the dt_combined data table

```
dt_names=read.table(".\\features.txt")
names(dt_combined) = dt_names[,2]
``` 

We find the columns corresponding to mean and standard deviation by searching the column names, and subset those columns
```
targetCols = grep("-mean()|-std()", dt_names$V2)
dt_extracted = dt_combined[,targetCols]
```

This leave us with some columns named meanFreq() in the dt_extracted data table. I'll remove these. I reason that since there is no corresponding stdFreq columns, these measures are fundamentally different from the target columns named mean() and std()
```
dt_extracted = dt_extracted[,which(!grepl("meanFreq()", colnames(dt_extracted))) ]
```

*Use descriptive activity names to name the activities in the data set*

This step replaces the numeric values in each row that denote the activity with English labels. Note that a more efficient method would replace the values in the condensed version of the data set (in which the mean is calculated resulting in far fewer rows), but I'm following instructions here. We read the training activities and replace the activity values with the activity labels. We don't merge because that would sort rows which would impact later steps.
```
dt_training_activities = read.table(".\\train\\y_train.txt")
dt_test_activities = read.table(".\\test\\y_test.txt")
dt_combined_activities = rbind(dt_training_activities, dt_test_activities)
dt_combined_activities$V1[dt_combined_activities$V1==1] = "WALKING"
(etc)
names(dt_combined_activities) = "Activity"
dt_extracted = cbind(dt_combined_activities, dt_extracted)
```

*Appropriately labels the data set with descriptive variable names*
This step involves swapping string fragments with real, descriptive words. We begin by grabbing the column names:
```
varNames = colnames(dt_extracted)
```
String substitution operations are applied to the varNames vector. For example, this code fragment finds variables starting with 't' and substitutes 'Time domain'
```
varNames[substring(varNames, 1, 1) == "t"] = sub("t", "Time domain ", varNames[substring(varNames, 1, 1) == "t"])
```
This code fragment finds 'Acc' and substitutes 'Acceleration'
```
varNames = gsub("Acc", " Acceleration", varNames)
```
After other such gyrations the new names are used for the column names...
```
names(dt_extracted) = varNames
```

*Create a second, independent tidy data set with the average of each variable for each activity and each subject*
So now we need the subject numbers. 'subject_train.txt' and 'subject_test.txt' contain the subject numbers for the respective data files, so we read the data, concatenate, and add to the dt_extracted data table...
```
dt_training_subs = read.table(".\\train\\subject_train.txt")
dt_test_subs = read.table(".\\test\\subject_test.txt")
dt_combined_subs = rbind(dt_training_subs, dt_test_subs)
names(dt_combined_subs) = "Subject"
dt_extracted = cbind(dt_combined_subs, dt_extracted)
```
Finally, use the 'aggregate' function to calculate the mean within subjects and activities
```
aggdata <-aggregate( . ~ Subject + Activity, data =dt_extracted, FUN=mean)
```
The final data set is written to a file named 'ActivityMeans.txt'


**codebook.md**

'codebook.md' describes the data files used for input and the data variables contained in the output file named 'ActivityMeans.txt'



