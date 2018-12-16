## Read in the data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## Read in the features
features <- read.table("./UCI HAR Dataset/features.txt")
## Read in the activity labels
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
##Create merged datasets 
FitData <- rbind(X_train, X_test)
Activities <- rbind(Y_train, Y_test)
SubjectInfo <- rbind(Subject_train, Subject_test)
## Extract the means and sds
selected_features <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
FitData <- FitData[,features[,1]]
## Use descriptive activity names for the activities
colnames(Activities) <- "Activity"
Activities$Label <- factor(Activities$Activity, labels = as.character(activitylabels[,2]))
## Label data set with descriptive variable names
colnames (FitData) <- features[selected_features[,1],2]
## create a tidy data set with the average of each variable for each activity and each subject
TotalFitData <- cbind(Activities, FitData)
colnames(SubjectInfo) <- "Subject"
TotalFitData <- cbind(SubjectInfo, TotalFitData)
MeanCalcsPrelim <- group_by(TotalFitData, Subject, activity)
MeanCalcsPrelim$Subject <- as.factor(MeanCalcsPrelim$Subject)
MeanCalcs <- aggregate(. ~Subject + activity, MeanCalcPrelim, mean)
write.table(MeanCalcs, file = "TidyWeek4.txt", row.names = FALSE)