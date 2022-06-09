#Getting and Cleaning Data Course Project
# The submitted data set is tidy. 
# 
# The Github repo contains the required scripts.
# 
# GitHub contains a code book that modifies and updates the available codebooks 
# with the data to indicate all the variables and summaries calculated, 
# along with units, and any other relevant information.
# 
# The README that explains the analysis files is clear and understandable.
# 
# The work submitted for this project is the work of the student who submitted it.
# 
# 
# You will be required to submit:
#    1) a tidy data set as described below
#    2) a link to a Github repository with your script for performing the analysis
#    3) a code book that describes the variables, the data, and any transformations 
#       or work that you performed to clean up the data called CodeBook.md. 
#       You should also include a README.md in the repo with your scripts. 
#       This repo explains how all of the scripts work and how they are connected.
#       
# Source data
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Project data
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following. 
# 
#     Merges the training and the test sets to create one data set.
# 
#     Extracts only the measurements on the mean and standard deviation for each measurement. 
# 
#     Uses descriptive activity names to name the activities in the data set
# 
#     Appropriately labels the data set with descriptive variable names. 
# 
#     From the data set in step 4, creates a second, independent tidy data set 
#        with the average of each variable for each activity and each subject.


setwd("~/CourseraRProjects/DataCleaning_Course_Project")
library(tidyverse)
if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/healthdata.zip", method = "curl")
unzip("./data/healthdata.zip", exdir = "../")


# Read in the files to establish subject, activity and variables for each observation
subjecttestURL <- "../UCI HAR Dataset/test/subject_test.txt"
subjecttrainURL <- "../UCI HAR Dataset/train/subject_train.txt"
obstestURL <- "../UCI HAR Dataset/test/X_test.txt"
obstrainURL <- "../UCI HAR Dataset/train/X_train.txt"
acttestURL <- "../UCI HAR Dataset/test/y_test.txt"
acttrainURL <- "../UCI HAR Dataset/train/y_train.txt"
featuresURL <- "../UCI HAR Dataset/features.txt"
actnamesURL <- "../UCI HAR Dataset/activity_labels.txt"

train.subjects <- read.table(subjecttrainURL)
test.subjects <- read.table(subjecttestURL)
train.vals <- read.table(obstrainURL)
test.vals <- read.table(obstestURL)
train.act <- read.table(acttrainURL)
test.act <- read.table(acttestURL)
features <- read.table(featuresURL)
act.names <- read.table(actnamesURL)

# Rename columns of single variable data sets (subjects and activities).
# Doing this early so as to not have to rename columns in the format 'V1...1'
# later after the columns are bound.
train.subjects <- train.subjects %>% rename(subject = V1)
train.act <- train.act %>% rename(activity = V1)
test.subjects <- test.subjects %>% rename(subject = V1)
test.act <- test.act %>% rename(activity = V1)
features <- features %>% rename(value_no = V1, value_name = V2)
act.names <- act.names %>% rename(act_no = V1, act_desc = V2)

# setup new and old column vectors for the feature data sets
# only capture the column names that have mean() and std() at the 
# end of the feature name. Other values excluded include meanFreq()
# values which are a weighted average of frequency components rather
# than the raw mean.

# Find the column positions with the mean() and std() values
col_numbers <- grep("mean|std", features$value_name)
#col_numbers <- grep("-mean\\(\\)|-std\\(\\)", features$value_name)

# Build the list of old column names, this allow for flexibility if columns
# are added or removed in the future
col_names_old <- str_c("V",col_numbers)

# Build the list of selected new column names from the features.txt file 
col_names_new <- features$value_name[col_numbers]   

# Select only the columns needed from the features data sets
train.vals <- train.vals %>% select(all_of(col_names_old))
test.vals <- test.vals %>% select(all_of(col_names_old))

# Rename the required features columns
colnames(train.vals) <- col_names_new
colnames(test.vals) <- col_names_new

# Combine the subject, activity, and features data sets by column into a single 
# data set
train.obs <- bind_cols(train.subjects, train.act, train.vals)
test.obs <- bind_cols(test.subjects, test.act, test.vals)

# Merge the test and train tables by row into a tidy observations data set
tidy.obs <- bind_rows(train.obs, test.obs)

# Add descriptive activity names
tidy.obs <- tidy.obs %>% mutate(activity = act.names$act_desc[activity])

# Group tidy observations by activity and subject
# Summarise for the average of each activity and subject
output_data <- tidy.obs %>% group_by(activity, subject) %>% summarise_all(mean)
#output_data <- tidy.obs %>% group_by(activity, subject) %>% summarise_if(is.numeric, mean)

write.table(output_data, "./data/run_analysis_out.txt",row.names = FALSE )