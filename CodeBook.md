#Code Book

==================================================================

Data from:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

Input Variables

* activity\_labels raw data from "activity_labels.txt"
* y\_train raw data from "y\_train.txt"
* y\_test raw data from "y\_test.txt"

* features raw data from "features.txt"
* X\_train raw data from "X\_train.txt"
* X\_test raw data from "X\_test.txt"

* subject\_train raw data from "subject\_train.txt"
* subject\_test raw data from "subject\_test.txt"

* the units of the above variables are from the raw dataset

Output Variables

* tidy_data combines the raw data from "X\_train.txt" and "X\_test.txt", replacing the numerical activity data with factors from "y\_train.txt" and "y\_test.txt", giving header names from "features.txt", selects only the columns dealing with mean or std, and computes the average for each subject (i.e. individual) and each activity (i.e. body position)

* the units of the variables in the tidy_dataset are the same as those from the raw dataset as they are an average of the variables in the raw dataset



