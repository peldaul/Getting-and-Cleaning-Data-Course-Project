  activity_labels <- read.table("activity_labels.txt")
  y_train <- read.table("train/y_train.txt", col.names=c("activity"))
  y_test <- read.table("test/y_test.txt", col.names=c("activity"))
  y_test$activity <- factor(y_test$activity, levels=activity_labels$V1, labels=activity_labels$V2)
  y_train$activity <- factor(y_train$activity, levels=activity_labels$V1, labels=activity_labels$V2)
  
  features <- read.table("features.txt")
  X_train <- read.table("./train/X_train.txt", col.names=features$V2, check.names=FALSE)
  X_test <- read.table("test/X_test.txt", col.names=features$V2, check.names=FALSE)
  mean_std <- grepl("mean|std", features$V2)
  X_train <- X_train[, mean_std]
  X_test <- X_test[, mean_std]
  
  subject_train <- read.table("train/subject_train.txt", col.names=c("subject"))
  subject_test <- read.table("test/subject_test.txt", col.names=c("subject"))
  
  train_data <- cbind(subject_train, y_train, X_train)
  test_data <- cbind(subject_test, y_test, X_test)
  total_data <- rbind(train_data, test_data)
  
  totalheader <- names(total_data)
  subject_activity <- totalheader[1:2]
  remaining_header <- totalheader[-2:-1]
  
  melted_data <- melt(total_data, id.vars=subject_activity, measure.vars=remaining_header)
  tidy_data = dcast(melted_data, subject + activity ~ variable, mean)

  write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)