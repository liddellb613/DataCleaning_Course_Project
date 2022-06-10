

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

   - READ.ME - description of the analysis processing performed

   - 8 files from the original the original project were loaded for the analysis:

   - Subjects associated with each observation in both test and train data:
         -  subjecttestURL <- "./UCI HAR Dataset/test/subject_test.txt" 
            - value between 1 and 30 representing on of the randomly selected subjects
         -  subjecttrainURL <- "./UCI HAR Dataset/train/subject_train.txt"
            - value between 1 and 30 representing one of the randomly selected subjects
   
   Feature observations for both test and train data:
         3. obstestURL <- "./UCI HAR Dataset/test/X_test.txt" 
            - 561 observational values listed in features.txt
         4. obstrainURL <- "./UCI HAR Dataset/train/X_train.txt" 
            - 561 observational values listed in features.txt
   
   Activity identifier for each of the observations in test and train
         5. acttestURL <- "./UCI HAR Dataset/test/y_test.txt" 
            - values between 1 and 6 listed in activity labels.txt
         6. acttrainURL <- "./UCI HAR Dataset/train/y_train.txt" 
            - values between 1 and 6 listed in activity labels.txt
   
   Feature labels for test and training
         7. featuresURL <- "./UCI HAR Dataset/features.txt" 
            - label for each of the observational values recorded for a subject and activity.
   
   Activity labels for each of the activity indicators
         8. actnamesURL <- "./UCI HAR Dataset/activity_labels.txt" 
            - list of activities
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
      list of the mean and std values collected for the subject and activity (79 values)
      
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
                  
   tidy.obs - data frame containing the combine test and training data sets. 
   the data is ordered by activity within subject rather than subject within
   activity.
      subject - subject number for this observation
      activity - type of activity performed for the observation
      list of the "mean" and "std" values collected for the subject and activity (79 values)
      1 tBodyAcc-mean()-X
      2 tBodyAcc-mean()-Y
      3 tBodyAcc-mean()-Z
      4 tBodyAcc-std()-X
      5 tBodyAcc-std()-Y
      6 tBodyAcc-std()-Z
      7 tGravityAcc-mean()-X
      8 tGravityAcc-mean()-Y
      9 tGravityAcc-mean()-Z
      10 tGravityAcc-std()-X
      11 tGravityAcc-std()-Y
      12 tGravityAcc-std()-Z
      13 tBodyAccJerk-mean()-X
      14 tBodyAccJerk-mean()-Y
      15 tBodyAccJerk-mean()-Z
      16 tBodyAccJerk-std()-X
      17 tBodyAccJerk-std()-Y
      18 tBodyAccJerk-std()-Z
      19 tBodyGyro-mean()-X
      20 tBodyGyro-mean()-Y
      21 tBodyGyro-mean()-Z
      22 tBodyGyro-std()-X
      23 tBodyGyro-std()-Y
      24 tBodyGyro-std()-Z
      25 tBodyGyroJerk-mean()-X
      26 tBodyGyroJerk-mean()-Y
      27 tBodyGyroJerk-mean()-Z
      28 tBodyGyroJerk-std()-X
      29 tBodyGyroJerk-std()-Y
      30 tBodyGyroJerk-std()-Z
      31 tBodyAccMag-mean()
      32 tBodyAccMag-std()
      33 tGravityAccMag-mean()
      34 tGravityAccMag-std()
      35 tBodyAccJerkMag-mean()
      36 tBodyAccJerkMag-std()
      37 tBodyGyroMag-mean()
      38 tBodyGyroMag-std()
      39 tBodyGyroJerkMag-mean()
      40 tBodyGyroJerkMag-std()
      41 fBodyAcc-mean()-X
      42 fBodyAcc-mean()-Y
      43 fBodyAcc-mean()-Z
      44 fBodyAcc-std()-X
      45 fBodyAcc-std()-Y
      46 fBodyAcc-std()-Z
      47 fBodyAcc-meanFreq()-X
      48 fBodyAcc-meanFreq()-Y
      49 fBodyAcc-meanFreq()-Z
      50 fBodyAccJerk-mean()-X
      51 fBodyAccJerk-mean()-Y
      52 fBodyAccJerk-mean()-Z
      53 fBodyAccJerk-std()-X
      54 fBodyAccJerk-std()-Y
      55 fBodyAccJerk-std()-Z
      56 fBodyAccJerk-meanFreq()-X
      57 fBodyAccJerk-meanFreq()-Y
      58 fBodyAccJerk-meanFreq()-Z
      59 fBodyGyro-mean()-X
      60 fBodyGyro-mean()-Y
      61 fBodyGyro-mean()-Z
      62 fBodyGyro-std()-X
      63 fBodyGyro-std()-Y
      64 fBodyGyro-std()-Z
      65 fBodyGyro-meanFreq()-X
      66 fBodyGyro-meanFreq()-Y
      67 fBodyGyro-meanFreq()-Z
      68 fBodyAccMag-mean()
      69 fBodyAccMag-std()
      70 fBodyAccMag-meanFreq()
      71 fBodyBodyAccJerkMag-mean()
      72 fBodyBodyAccJerkMag-std()
      73 fBodyBodyAccJerkMag-meanFreq()
      74 fBodyBodyGyroMag-mean()
      75 fBodyBodyGyroMag-std()
      76 fBodyBodyGyroMag-meanFreq()
      77 fBodyBodyGyroJerkMag-mean()
      78 fBodyBodyGyroJerkMag-std()
      79 fBodyBodyGyroJerkMag-meanFreq()
      
   col_names_new - character vector of column names for all 66 feature values (79 values)
      tBodyAcc-mean()-X ... fBodyBodyGyroJerkMag-meanFreq()
   col_names_old - character vector of default column names created by reading in the values (79 values)
      v1...v543
   col_numbers - vector of numbers representing columns in the features data frames which will (79 values)
      be selected for the final tidy data set. Used to build the old and new column names vector
      1 ... 543
   
   