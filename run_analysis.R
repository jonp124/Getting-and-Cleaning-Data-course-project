run_analysis <- function(){
  
  filename <- "Coursera_DS3_Final.zip"
  
  # Check if the file exists already, if not download and assign filename
  if(!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename)
  }
  
  # Check if the file folder exists, if not, unzip the file
  if (!file.exists("UCI HAR Dataset")){
    unzip(filename)
  }
  
  
  # Assign data to variables
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("n", "functions"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("code", "activity"))
  
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
  
  # Merge the training and test data
  X <- rbind(x_train, x_test)
  Y <- rbind(y_train, y_test)
  Subject <- rbind(subject_train, subject_test)
  Merged_data <- cbind(Subject, Y, X)
  
  # Select interested columns
  Tidy_data <- Merged_data %>% select(subject, code, contains("mean"), contains("std"))
  
  # Set appropriate activity names
  Tidy_data$code <- activities[Tidy_data$code, 2]
  
  # Make labels readable
  names(Tidy_data)[2] = "activity"
  names(Tidy_data) <- gsub("Gyro", "Gyroscope", names(Tidy_data))
  names(Tidy_data) <- gsub("Acc", "Accelerometer", names(Tidy_data))
  names(Tidy_data) <-gsub("BodyBody", "Body", names(Tidy_data))
  names(Tidy_data) <-gsub("Mag", "Magnitude", names(Tidy_data))
  names(Tidy_data) <-gsub("tBody", "TimeBody", names(Tidy_data))
  names(Tidy_data) <-gsub("^t", "Time", names(Tidy_data))
  names(Tidy_data) <-gsub("^f", "Frequency", names(Tidy_data))
  names(Tidy_data) <-gsub("-std()", "STD", names(Tidy_data), ignore.case=TRUE)
  names(Tidy_data) <-gsub("-mean()", "Mean", names(Tidy_data), ignore.case=TRUE)
  names(Tidy_data) <-gsub("-freq()", "Frequency", names(Tidy_data), ignore.case = TRUE)
  names(Tidy_data) <-gsub("angle", "Angle", names(Tidy_data))
  names(Tidy_data) <-gsub("gravity", "Gravity", names(Tidy_data))
  
  # Create a final data set organized by subject/activity and displaying the mean
  Final_data <- Tidy_data %>%
    group_by(subject, activity) %>%
    summarize_all(funs(mean))
  
  # Create a table with our final data set
  write.table(Final_data, "Final_data.txt", row.name=FALSE)
  
}