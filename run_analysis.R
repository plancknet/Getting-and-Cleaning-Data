# OK - Merges the training and the test sets to create one data set.

    ## reading test data
    subject_test  <- read.table("test/subject_test.txt", header = FALSE, col.names = 'subject')
    activity_test <- read.table("test/y_test.txt", header = FALSE, col.names = 'activity')
    measure_test  <- read.table("test/x_test.txt", header = FALSE)
    
    ## aggregating test data in one dataset
    test_dataset  <- subject_test
    test_dataset$activity <- activity_test$activity
    test_dataset <- cbind(test_dataset, measure_test)
    
    ## reading train data
    subject_train  <- read.table("train/subject_train.txt", header = FALSE, col.names = 'subject')
    activity_train <- read.table("train/y_train.txt", header = FALSE, col.names = 'activity')
    measure_train  <- read.table("train/x_train.txt", header = FALSE)
    
    ## aggregating train data in one dataset
    train_dataset  <- subject_train
    train_dataset$activity <- activity_train$activity
    train_dataset <- cbind(train_dataset, measure_train)
    
    ## join test and train data in on dataset
    one_dataset    <- rbind(train_dataset, test_dataset)



# Appropriately labels the data set with descriptive variable names

    ## acquiring column names
    features <- read.table("features.txt")
    features$V2 <- as.character(features$V2)
    column_names <- rbind(c("-1", "subject"), c("0", "activity"), features)
    
    ## setting column names
    names(one_dataset) = column_names$V2


# Extracts only the measurements on the mean and standard deviation for each measurement
    
    extract_features <- grepl("mean|std", column_names$V2)

    ## keeping subject and activity attributes 
    extract_features[1:2] <- TRUE
    
    extract_dataset <- one_dataset[,extract_features]

# Uses descriptive activity names to name the activities in the data set
    activity_labels <- read.table("activity_labels.txt")
    activity_labels$V2 <- as.character(activity_labels$V2)

    ## merging datasets
    descriptive_dataset <- merge(x = extract_dataset, y = activity_labels, by.x = 'activity', by.y = 'V1')

    ## eliminating unnecessary column
    descriptive_dataset$activity <- descriptive_dataset$V2
    descriptive_dataset$V2 <- NULL

# independent tidy data set with the average of each variable for each activity and each subject.
    independent_dataset <- aggregate(descriptive_dataset, by = list(descriptive_dataset$subject, descriptive_dataset$activity), FUN = "mean")
    independent_dataset$activity <- independent_dataset$Group.2
    independent_dataset$subject <- independent_dataset$Group.1
    independent_dataset$Group.1 <- NULL
    independent_dataset$Group.2 <- NULL
    
## writing datasets in text files
   write.table(descriptive_dataset, './descriptive_dataset.txt', row.names = F)
   write.table(independent_dataset, './independent_dataset.txt', row.names = F)
    
    

