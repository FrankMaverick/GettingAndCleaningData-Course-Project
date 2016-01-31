Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in *dataFeaturesTrain*, *dataActivityTain* and *dataSubjectTrain* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in *dataFeaturesTest*, *dataActivityTest* and *dataSubjectTest* variables respectively.  
 3. Concatenate *dataFeaturesTrain* to *dataFeaturesTest* to generate a 10299x561 data frame, *dataFeatures*; concatenate *dataSubjectTrain* to *dataSubjectTest* to generate a 10299x1 data frame, *dataSubject*; concatenate *dataActivityTrain* to *dataActivityTest* to generate a 10299x1 data frame, *dataActivity*.  
 4. Read the features.txt file from the "/data" folder and store the data of second column in a variable called *dataFeaturesNames* and this variable is used to set the names of *dataFeatures*.  
 5. Merge *dataFeatures*, *dataSubject* and *dataActivity* in a 10299x563 data frame, *dataset*.
 6. Extract only the measurements on the mean and standard deviation for each measurement of *dataset* to generate a 10299*68 data frame, *dataset*.
 7. Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called *activityLabels* and this variable is used to use descriptive activity names to name the activities in the *dataset*.
 8. Clean the column names of the *dataset*:
    - prefix t is replaced by time
    - Acc is replaced by Accelerometer
    - Gyro is replaced by Gyroscope
    - prefix f is replaced by frequency
    - Mag is replaced by Magnitude
    - BodyBody is replaced by Body 
 9. Generate a second independent 180*68 tidy data frame *secondAvgDataset* with the average of each measurement for each activity and each subject.
 10. Write the *dataset* out to "data-HARUS.txt" file in current working directory. 
 11. Write the *secondAvgDataset* out to "tidy-data-HARUS.txt" file in current working directory. 
 
© Francesco Cardinale 2016 All Rights reserved.