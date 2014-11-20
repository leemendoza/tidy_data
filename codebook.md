---
title: "codebook.md"
author: "Lee Mendoza"
date: "Tuesday, November 18, 2014"
output: html_document
---

**This file describes the data files used for input and the data variables contained in the output file.**

The script makes use of motion data captured from 30 persons wearing a smartphone (see README.txt for a full explanation of the source data). Other files used in the creation of the output file:
- 'features_info.txt': Shows detailed information about the variables in the original data sources.
- 'features.txt': List of all features in the original data set.
- 'activity_labels.txt': Links the class labels with their original activity name.
- 'train/X_train.txt': Training data set.
- 'train/y_train.txt': Original activity labels for the training data.
- 'test/X_test.txt': Test data set.
- 'test/y_test.txt': original activity labels for the test data.

The data in the 'train/subject_train.txt' and 'test/subject_test.txt' files were combined to form a composite set of source data. 

Output file: ActivityMeans.txt is a comma delimited text file in wide format. Within the file, the columns are defined as follows

- Subject - integer ranging from 1-30, corresponding to the identifier of the subject
- Activity - text descriptor, with values LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, and WALKING_UPSTAIRS
- Measurements - the remainder of the columns are measurement variables. The name of the column consists of several components and indicate some significant aspect of the variable
    - Time domain xxxxx - variables measured in the time domain.
    - Freq domain xxxxx - variables measured in the frequency domain.
    - xxxx Acceleration xxxx - variables measured in standard gravity units
    - xxxx Gyroscope xxxx - variables measured in radians/second
    - xxxx mean() xxxx - average of the mean measurements
    - xxxx std() xxxx - average of the standard deviations of the measurements
    - X - where applicable, indicates the measurement is of the X axis of the device
    - Y - where applicable, indicates the measurement is of the Y axis of the device
    - Z - where applicable, indicates the measurement is of the Z axis of the device




For more information about the orginial source dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
