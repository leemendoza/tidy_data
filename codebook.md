---
title: "codebook.md"
author: "Lee Mendoza"
date: "Tuesday, November 18, 2014"
output: html_document
---

**This file describes the data files used for input and the data variables contained in the output file.**

The script makes use of motion data captured from 30 persons wearing a smartphone (see README.txt for a full explanation of the source data). Other files used in the creation of the output file:
- 'features_info.txt': Shows detailed information about the variables used on the feature vector.
- 'features.txt': List of all features in the original data set.
- 'activity_labels.txt': Links the class labels with their original activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files for the train and test data and were combined to form a composite set of source data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Output file:
- ActivityMeans.txt is a comma delimited text file in wide format.  
- Subject - integer ranging from 1-30, corresponding to the identifier of the subject
- Activity - text descriptor, with values LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, and WALKING_UPSTAIRS
- Measurements - the remainder of the variables are measurements. The name of the variable consists of several components and indicate some significant aspect of the variable
-- Time domain xxxxx - variables measured in the time domain.
-- Freq domain xxxxx - variables measured in the frequency domain.
-- xxxx Acceleration xxxx - variables measured in standard gravity units
-- xxxx Gyroscope xxxx - variables measured in radians/second
-- xxxx mean() xxxx - average of the mean measurements
-- xxxx std() xxxx - average of the standard deviations of the measurements
-- X - where applicable, indicates the measurement is of the X axis of the device
-- Y - where applicable, indicates the measurement is of the Y axis of the device
-- Z - where applicable, indicates the measurement is of the Z axis of the device




For more information about the orginial source dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

