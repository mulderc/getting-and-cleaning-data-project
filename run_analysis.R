# 1. Merges the training and the test sets to create one data set.


#read in data files
Features       = read.table('UCI HAR Dataset/features.txt'           ,header=FALSE)
ActivityLabels = read.table('UCI HAR Dataset/activity_labels.txt'    ,header=FALSE)
SubjectTrain   = read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE)
TrainX         = read.table('UCI HAR Dataset/train/x_train.txt'      ,header=FALSE)
TrainY         = read.table('UCI HAR Dataset/train/y_train.txt'      ,header=FALSE)
SubjectTest    = read.table('UCI HAR Dataset/test/subject_test.txt'  ,header=FALSE)
TestX          = read.table('UCI HAR Dataset/test/x_test.txt'        ,header=FALSE)
TestY          = read.table('UCI HAR Dataset/test/y_test.txt'        ,header=FALSE)

#Add variable names to data frames
names(ActivityLabels) = c('ActivityID','ActivityType')
names(SubjectTrain)   = "SubjectID"
names(TrainX)         = Features[,2] 
names(TrainY)         = "ActivityID"
names(SubjectTest)    = "SubjectID"
names(TestX)          = Features[,2]
names(TestY)          = "ActivityID"

#bind together test and training data
TrainData = cbind(SubjectTrain,TrainX,TrainY)
TestData  = cbind(SubjectTest,TestX,TestY)

#Merge together test and training data
MergedData = rbind(TrainData,TestData)



# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

#Get names for the columns
ColumnNames  = names(MergedData)

# Create a vector that contains TRUE values for the ActivityID, SubjectID, mean() & std() columns and FALSE for others
LogicalVector = (grepl("ActivityID",ColumnNames) | 
                 grepl("SubjectID" ,ColumnNames) | 
                 grepl("mean()"    ,ColumnNames) | 
                 grepl("std()"     ,ColumnNames) )


# Subset finalData table based on the logicalVector to keep only desired columns
FinalData = MergedData[LogicalVector == TRUE]

# 3. Use descriptive activity names to name the activities in the data set

# Merge the finalData set with the acitivityType table to include descriptive activity names
#finalData = merge(DataSubset,ActivityLabels,by='ActivityID',all.x=TRUE);

# replace activity values with named factor levels
FinalData$ActivityID <- factor(FinalData$ActivityID, 
                                 levels = ActivityLabels[, 1], labels = ActivityLabels[, 2])
# Updating the colNames vector to include the new column names after merge
ColNames  = colnames(FinalData); 

# 4. Appropriately label the data set with descriptive activity names. 

ColNames <- gsub("[\\(\\)-]", "",            ColNames)
ColNames <- gsub("^f", "frequencyDomain",    ColNames)
ColNames <- gsub("^t", "timeDomain",         ColNames)
ColNames <- gsub("Acc", "Accelerometer",     ColNames)
ColNames <- gsub("Gyro", "Gyroscope",        ColNames)
ColNames <- gsub("Mag", "Magnitude",         ColNames)
ColNames <- gsub("Freq", "Frequency",        ColNames)
ColNames <- gsub("mean", "Mean",             ColNames)
ColNames <- gsub("std", "StandardDeviation", ColNames)
ColNames <- gsub("BodyBody", "Body",         ColNames)



# Reassigning the new descriptive column names to the finalData set
colnames(FinalData) = ColNames;

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

# New Tidy DataFrame, finalDataNoActivityType without the activityType column
FinalDataTidy <- FinalData %>% 
  group_by(SubjectID, ActivityID) %>%
  summarise_each(funs(mean))

# output "tidy_data.txt"
write.table(FinalDataTidy, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)

