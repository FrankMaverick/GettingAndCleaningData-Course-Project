# 1. Merges the training and the test sets to create one data set.

## read data
dataFeaturesTrain <- read.table('./data/train/X_train.txt') 
dataActivityTrain <- read.table('./data/train/y_train.txt') 
dataSubjectTrain <- read.table('./data/train/subject_train.txt') 

dataFeaturesTest <- read.table('./data/test/X_test.txt') 
dataActivityTest <- read.table('./data/test/y_test.txt') 
dataSubjectTest <- read.table('./data/test/subject_test.txt') 

## merge data
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)

## set names of dataSets
names(dataSubject) <- "subject"
names(dataActivity) <- "activity"
dataFeaturesNames <- read.table('./data/features.txt')[,2]
names(dataFeatures) <- dataFeaturesNames

## Merge columns to get the data frame data for all data
dataset <- cbind(dataFeatures, dataSubject, dataActivity)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
subDataFeaturesNames <- as.character(dataFeaturesNames[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames)])
selectedDataFeaturesNames <- c(subDataFeaturesNames, names(dataSubject), names(dataActivity))

dataset <- dataset[selectedDataFeaturesNames]

# 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table('./data/activity_labels.txt', col.names = c("activity", "activityName"))
dataset$activity = activityLabels[dataset$activity, 2]

# 4. Appropriately labels the data set with descriptive variable names.
# prefix t is replaced by time
# Acc is replaced by Accelerometer
# Gyro is replaced by Gyroscope
# prefix f is replaced by frequency
# Mag is replaced by Magnitude
# BodyBody is replaced by Body
names(dataset)<-gsub("^t", "time", names(dataset))
names(dataset)<-gsub("^f", "frequency", names(dataset))
names(dataset)<-gsub("Acc", "Accelerometer", names(dataset))
names(dataset)<-gsub("Gyro", "Gyroscope", names(dataset))
names(dataset)<-gsub("Mag", "Magnitude", names(dataset))
names(dataset)<-gsub("BodyBody", "Body", names(dataset))

# 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of 
# each variable for each activity and each subject.
secondAvgDataset <- aggregate(. ~ subject + activity, dataset, mean)

# Produce output files
write.table(dataset, file = "./data-HARUS.txt",row.name=FALSE)
write.table(secondAvgDataset, file = "./tidy-data-HARUS.txt",row.name=FALSE)
