---
title: "README"
author: "Jon"
date: "10/27/2019"
output: html_document
---
# Getting and Cleaning Data course project

## Dataset
The data used for this project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

And a description can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files
* CodeBook.md, a document that describes the variables, data, and steps taken in processing/cleaning the data
* run_analysis.R, the R script that executes the steps described in CodeBook and the project description:
    + Merges the training and test data sets
    + Extracts the measurements on the mean and standard deviation
    + Uses descriptive activity names for the activities in the data set
    + Updates the variable names with more descriptive and readable labels
    + Creates a second independent tidy data set with the mean of each variable grouped by activity and subject
* Final_data.txt, the product of run_analysis.R, the final tidy code produced by following the steps described above.
