# Getting and Cleaning Data Course Project

Introduction
------------

This repo contains code for completing the peer reviewed course project for the Courseara Getting and Cleaning Data course.


What it does!
-------------

The R script called run_analysis.R does the following.

0. Downloads the data, unzips is, loads the tidyverse packages

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set (tidy_data.txt) with the average of each variable for each activity and each subject.

The Raw Data
------------

The data used in this script can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Code Book
-------------
`CODEBOOK.md` file describes the variables found in IndependentTidyDataSet.txt.
