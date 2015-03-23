This project deals with acivity data. I have provided run_analysis.R script to generate tidy data.It is assumed that all files are in the current directory.

1>Read the training and test data files and merge them to create one dataset. 

Test and train data is stored in three different files. First we read y_test.txt, subject_test.txt and x_test.txt file. We change the column name of subject_test dataframe to "subject".
At this stage 561 columns from x_test dataframe are named V1...V561. All the column names are present in feature.txt. So we read this file and apply column names to x_test dataframe columns.
They are changed from V1,V2 to tBodyAcc-mean()-X,tBodyAcc-mean()-Y etc. We repeat the same steps for train data_set by reading y_train.txt,subject_train.txt X_train.txt files.
We apply similar column name transformation as we have done for test dataset. We merge y_test, subject_test and x_test dataframes to generate test_data set. We follow similar steps
for train data to generate train dataset. 

2> Add descriptive activity names to name the activities in the data set

Decriptive activity names are present in activity_lable.txt file. We read this file and merge activity label data with activity id from merged data.
Now all acitivities have text values instead of number values.


2> Extract only the measurements on the mean and standard deviation for each measurement. 

We extract mean, std, subject and activity columns from merged dataset. This way our dataset size reduced down to 81 columns.


3> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally we aggregate the data and convert it into tidy data and write to "tidy_data.txt" file using write.table() function 
