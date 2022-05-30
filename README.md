

This R script and the resulting data set utilizes the work of the Human Activity Recognition Using Smartphones Dataset
found at the link below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

A summary of this work from the original authors includes:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


Further shaping and analysis of the data is performed in the run_analysis.R script including:

   1. Read in the 8 source files needed to perform the analysis
   2. Rename the variables in the data frames:
      -test.act
      -train.act
      -test.subject
      -train.subject
      -features
      -act.names
   3. Find the columns in the features data frame containing mean() or std() for selection
   4. Build the old and new vectors for use in the selection statement
   5. Select out the columns for test and train
   6. Rename the column names for both the test and train observation data frames
      -test.obs
      -train.obs
   7. Combine the test and train data frames into a single data set
   8. Group the data by activity and subject 
   9. Summarize the data by taking the mean of the groups
   10.Write out the data frame to a tidy data set - run_analysis_out.txt

Output tidy (wide) data set - run_analysis_out.txt

The result data file can be accessed by read.table("run_analysis_out.txt")

