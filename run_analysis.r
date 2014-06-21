setwd("/Users/markhorton/datasciencecoursera/UCI HAR Dataset/")
#this section gets the data from both the train and test folders
#this simply extracts and merges the data into 3 variables X, S, Y
tmp1 <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
X <- rbind(tmp1, tmp2)

tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
S <- rbind(tmp1, tmp2)

tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# This section find the ID's for the columns that are for the mean and standard deviation
features <- read.table("features.txt")
requiredfeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, requiredfeatures]
names(X) <- features[requiredfeatures, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))  

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "combined_data.txt")
head(cleaned)

distinctSubjects = unique(S)[,1]
cntSubjects = length(unique(S)[,1])
cntActivities = length(activities[,1])
cntCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*cntActivities), ]

row = 1
for (s in 1:cntSubjects) {
  for (a in 1:cntActivities) {
    result[row, 1] = distinctSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidydatset.txt")
read.table("tidydatset.txt")
