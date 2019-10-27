---
title: "Code Book"
author: "Jon"
date: "10/26/2019"
output: html_document
---
# Code book for Getting and Cleaning Data course project

The data set this code book describes is located in the "Final_data.txt" file included in this repository.

The "run_analysis.R" script, located in the same repository, performs the data preparation and additional steps outlined in the project definition

The steps taken are described below

## Download the dataset <a name="download the dataset"></a>

* Dataset downloaded, unzipped and extracted to a folder named "UCI HAR Dataset

## Assign data to variables <a name="Assign data to variables"></a>
* features <- features.txt, the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals

* activities <- activity_lavels.txt List of activities performed and their corresponding codes

* subject_test <- test/subject_test.txt contains test data of volunteer test subjects

* x_test <- test/X_test.txt contains recorded features test data

* y_test <- test/y_test.txt contains test data of activities' code labels

* subject_train <- test/subject_train.txt contains train data of volunteer subjects

* x_train <- test/X_train.txt contains recorded features train data

* y_train <- test/y_train.txt contains recorded data of activities' code labels


## Merge train and test data <a name="Merge"></a>

* X, created by merging rows of x_train and x_test
* Y, created by merging rows of y_train and y_test
* Subject, created by merging rows of subject_train and subject_test
* Merged_data, created by merging columns of the three data frames above

## Extract measurements on mean and standard deviation <a name="Extract"></a>
* Took a subset of Merged_data containing only the columns "subject", "code" and measurements including "mean" or standard deviation "std"


## Update activity names <a name="Update"></a>
* Updated the code column in Tidy_data to use descriptive activity taken corresponding to the numerical code taken from the activities data frame

## Update labels to make dataset more readable <a name="Labels"></a>
* code column in Tidy_data renames to activities
* replace "Acc" with "Accelerometer"
* replace "Gyro" with "Gyroscope"
* replace "BodyBody" with "Body"
* replace "Mag" with "Magnitude"
* replace "angle" with "Angle"
* replace "gravity" with "Gravity"
* All columns beginning with character "t" replace with "Time"
* All columns beginning with character "f" replace with "Frequency"

## Create final data set
* from the dataset in the previous set, create Final_data by summarizing each variable after grouping by subject and activity
* Write Final_data into the Final_data.txt file


