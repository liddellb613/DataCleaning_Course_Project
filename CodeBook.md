

Human Activity Recognition Using Smartphones Dataset


Files from the original study used in this analysis include:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features. Labels for the 561-feature

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set. A 561-feature vector with time and frequency domain variables. 

- 'train/y_train.txt': Training labels. An identifier of the activity carried out in the experiment.

- 'test/X_test.txt': Test set. A 561-feature vector with time and frequency domain variables.

- 'test/y_test.txt': Test labels. An identifier of the activity carried out in the experiment.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Data sets used or created for the analysis:

   READ.ME - description of the analysis processing performed

   8 files from the original data were loaded for the analysis:

   Subjects associated with each observation in both test and train data:
      1. subjecttestURL <- "./UCI HAR Dataset/test/subject_test.txt" - value between 1 and 30 representing on of the               randomly selected subjects 
      2. subjecttrainURL <- "./UCI HAR Dataset/train/subject_train.txt" - value between 1 and 30 representing on of the            randomly selected subjects 

   Feature observations for both test and train data:
      3. obstestURL <- "./UCI HAR Dataset/test/X_test.txt" - 561 observational values listed in features.txt
      4. obstrainURL <- "./UCI HAR Dataset/train/X_train.txt" - 561 observational values listed in features.txt
   
   Activity identifier for each of the observations in test and train
      5. acttestURL <- "./UCI HAR Dataset/test/y_test.txt" - values between 1 and 6 listed in activity labels.txt
      6. acttrainURL <- "./UCI HAR Dataset/train/y_train.txt" - values between 1 and 6 listed in activity labels.txt
   
   Feature labels for test and training
      7. featuresURL <- "./UCI HAR Dataset/features.txt" - label for each of the observational values recorded for a               subject and activity .
   
   Activity labels for each of the activity indicators    
      8. actnamesURL <- "./UCI HAR Dataset/activity_labels.txt" - list of activities 
         1 WALKING
         2 WALKING_UPSTAIRS
         3 WALKING_DOWNSTAIRS
         4 SITTING
         5 STANDING
         6 LAYING

Additional data modification performed by the run_analysis.R script:

   test/train.subjects - single column data frame with the subject identification 
      for each test observation in the test set
      subject - 1 to 30
   
   test/train.act - single column data frame with the activity being performed
      for the test feature values collected 
      activity - 
         1 WALKING
         2 WALKING_UPSTAIRS
         3 WALKING_DOWNSTAIRS
         4 SITTING
         5 STANDING
         6 LAYING
   
   test/traing.obs - 561 feature values collected by the test subjects in the original experiment
      subject - subject number for this observation
      activity - type of activity performed for the observation
      list of the mean() and std() values collected for the subject and activity (66 values)
      
   features - names for all 561 features values collected
      value_no - number of the feature index
      value_name - name of the feature value
      
   act.names - list of activity names and index numbers
      act_no - 1 to 6
      act_desc -  WALKING
                  WALKING_UPSTAIRS
                  WALKING_DOWNSTAIRS
                  SITTING
                  STANDING
                  LAYING
                  
   tidy.obs - data frame containing the combine test and training data sets
      subject - subject number for this observation
      activity - type of activity performed for the observation
      list of the mean() and std() values collected for the subject and activity (66 values)
      
   col_names_new - character vector of column names for all 66 feature values (66 values)
      tBodyAcc-mean()-X ... fBodyBodyGyroJerkMag-std()
   col_names_old - character vector of default column names created by reading in the values (66 values)
      v1...v543
   col_numbers - vector of numbers representing columns in the features data frames which will (66 values)
      be selected for the final tidy data set. Used to build the old and new column names vector
      1 ... 543
   
   