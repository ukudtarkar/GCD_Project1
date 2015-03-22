library(dplyr)
library(data.table)

# Read the test data
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
setnames(subject_test,"V1","subject")
x_test <- read.table("X_test.txt")

# Read features data and set column names
featuers <- read.table("features.txt")
colNames <- featuers[,c("V2")]
valid_column_names <- make.names(names=colNames, unique=TRUE, allow_ = TRUE)
colnames(x_test) <- valid_column_names
test_data <- cbind(x_test,y_test,subject_test)

# Read train data 
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
setnames(subject_train,"V1","subject")
x_train <- read.table("X_train.txt")
# Set column names
colnames(x_train) <- valid_column_names
train_data <- cbind(x_train,y_train,subject_train)

# Merge train and test data
merged_data <- rbind(test_data,train_data)

# Update activity values with activity labels
activity_labels <- read.table("activity_labels.txt")
setnames(activity_labels,"V2","activity")
merged_data <- merge(merged_data,activity_labels,by.x=c("V1"),by.y=c("V1"))

# Select column names with mean and std names
selected_data <- select(merged_data, matches("(subject)+|(activity)+|(mean)+|(std)+", ignore.case = FALSE))

# Aggregate data based on activity and subject
agg_data <- aggregate(selected_data[,!(names(selected_data) %in% c("activity","subject"))],list(activity = selected_data$activity, subject = selected_data$subject),mean)

# Write tidy data to output file
write.table(agg_data,"tidy_data.txt",row.names=FALSE)
