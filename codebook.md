DATA DICTIONARY - Getting and Cleaning Data Course Project
==========================================
R script called run_analysis.R does the following data cleaning and manipluation.

0. Download data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

1. Merges the training(X_train.txt, y_train.txt, subject_train.txt) and the test (X_test.txt, y_test.txt, subject_test.txt) data to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement by keeping only the varibles with "mean" or "std" in the label

3. Uses descriptive activity names to name the activities in the data set using the key found in Activity_labels.txt

4. Appropriately labels the data set with descriptive variable names by relabeling vairbales with better descriptive names

5. Creates an independent tidy data set (IndependentTidyDataSet.txt) with the average of each variable for each activity and each subject.


## Identififiers
"SubjectID" [factor 1:30]  ID of the subject who performed the activity, 30 in total
	
"ActivityID" [factor 1:6]  ID of the activity name
	
Activity Code
	
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

## Measurements
the average of each variable for each activity and each subject.

"timeDomainBodyAccelerometerMeanX"                                  
"timeDomainBodyAccelerometerMeanY"                                  
"timeDomainBodyAccelerometerMeanZ"                                  
"timeDomainBodyAccelerometerStandardDeviationX"                     
"timeDomainBodyAccelerometerStandardDeviationY"                     
"timeDomainBodyAccelerometerStandardDeviationZ"                     
"timeDomainGravityAccelerometerMeanX"                               
"timeDomainGravityAccelerometerMeanY"                               
"timeDomainGravityAccelerometerMeanZ"                               
"timeDomainGravityAccelerometerStandardDeviationX"                  
"timeDomainGravityAccelerometerStandardDeviationY"                  
"timeDomainGravityAccelerometerStandardDeviationZ"                  
"timeDomainBodyAccelerometerJerkMeanX"                              
"timeDomainBodyAccelerometerJerkMeanY"                              
"timeDomainBodyAccelerometerJerkMeanZ"                              
"timeDomainBodyAccelerometerJerkStandardDeviationX"                 
"timeDomainBodyAccelerometerJerkStandardDeviationY"                 
"timeDomainBodyAccelerometerJerkStandardDeviationZ"                 
"timeDomainyroscopeMeanX"                                      
"timeDomainBodyGyroscopeMeanY"                                      
"timeDomainBodyGyroscopeMeanZ"                                      
"timeDomainBodyGyroscopeStandardDeviationX"                         
"timeDomainBodyGyroscopeStandardDeviationY"                         
"timeDomainBodyGyroscopeStandardDeviationZ"                         
"timeDomainBodyGyroscopeJerkMeanX"                                  
"timeDomainBodyGyroscopeJerkMeanY"                                  
"timeDomainBodyGyroscopeJerkMeanZ"                                  
"timeDomainBodyGyroscopeJerkStandardDeviationX"                     
"timeDomainBodyGyroscopeJerkStandardDeviationY"                     
"timeDomainBodyGyroscopeJerkStandardDeviationZ"                     
"timeDomainBodyAccelerometerMagnitudeMean"                          
"timeDomainBodyAccelerometerMagnitudeStandardDeviation"             
"timeDomainGravityAccelerometerMagnitudeMean"                       
"timeDomainGravityAccelerometerMagnitudeStandardDeviation"          
"timeDomainBodyAccelerometerJerkMagnitudeMean"                      
"timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation"         
"timeDomainBodyGyroscopeMagnitudeMean"                              
"timeDomainBodyGyroscopeMagnitudeStandardDeviation"                 
"timeDomainBodyGyroscopeJerkMagnitudeMean"                          
"timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation"             
"frequencyDomainBodyAccelerometerMeanX"                             
"frequencyDomainBodyAccelerometerMeanY"                             
"frequencyDomainBodyAccelerometerMeanZ"                             
"frequencyDomainBodyAccelerometerStandardDeviationX"                
"frequencyDomainBodyAccelerometerStandardDeviationY"                
"frequencyDomainBodyAccelerometerStandardDeviationZ"                
"frequencyDomainBodyAccelerometerMeanFrequencyX"                    
"frequencyDomainBodyAccelerometerMeanFrequencyY"                    
"frequencyDomainBodyAccelerometerMeanFrequencyZ"                    
"frequencyDomainBodyAccelerometerJerkMeanX"                         
"frequencyDomainBodyAccelerometerJerkMeanY"                         
"frequencyDomainBodyAccelerometerJerkMeanZ"                         
"frequencyDomainBodyAccelerometerJerkStandardDeviationX"            
"frequencyDomainBodyAccelerometerJerkStandardDeviationY"            
"frequencyDomainBodyAccelerometerJerkStandardDeviationZ"            
"frequencyDomainBodyAccelerometerJerkMeanFrequencyX"                
"frequencyDomainBodyAccelerometerJerkMeanFrequencyY"                
"frequencyDomainBodyAccelerometerJerkMeanFrequencyZ"                
"frequencyDomainBodyGyroscopeMeanX"                                 
"frequencyDomainBodyGyroscopeMeanY"                                 
"frequencyDomainBodyGyroscopeMeanZ"                                 
"frequencyDomainBodyGyroscopeStandardDeviationX"                    
"frequencyDomainBodyGyroscopeStandardDeviationY"                    
"frequencyDomainBodyGyroscopeStandardDeviationZ"                    
"frequencyDomainBodyGyroscopeMeanFrequencyX"                        
"frequencyDomainBodyGyroscopeMeanFrequencyY"                        
"frequencyDomainBodyGyroscopeMeanFrequencyZ"                        
"frequencyDomainBodyAccelerometerMagnitudeMean"                     
"frequencyDomainBodyAccelerometerMagnitudeStandardDeviation"        
"frequencyDomainBodyAccelerometerMagnitudeMeanFrequency"            
"frequencyDomainBodyBodyAccelerometerJerkMagnitudeMean"             
"frequencyDomainBodyBodyAccelerometerJerkMagnitudeStandardDeviation"
"frequencyDomainBodyBodyAccelerometerJerkMagnitudeMeanFrequency"    
"frequencyDomainBodyBodyGyroscopeMagnitudeMean"                     
"frequencyDomainBodyBodyGyroscopeMagnitudeStandardDeviation"        
"frequencyDomainBodyBodyGyroscopeMagnitudeMeanFrequency"            
"frequencyDomainBodyBodyGyroscopeJerkMagnitudeMean"                 
"frequencyDomainBodyBodyGyroscopeJerkMagnitudeStandardDeviation"    
"frequencyDomainBodyBodyGyroscopeJerkMagnitudeMeanFrequency"
