This project deals with acivity data. I have provided run_analysis.R script to generate tidy data.It is assumed that all files are in current directory.

1>Read the training and text data files and merge them to create one dataset. 

test_data stores train data and x_test stores test data.This data is merged into test_data object. Columns are appropriately named from reading
activity labels.

2> Extract only the measurements on the mean and standard deviation for each measurement. 

3> Add descriptive activity names to name the activities in the data set

4> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally we aggregate the data and convert into tidy data and write to "tidy_data.txt" file using write.table() function 
