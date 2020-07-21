# Step 1 -- merge the training and test sets into one dataset
# install necessary package and download and extract the zip file
library(dplyr)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./zippedData")
filepaths <- unzip("./zippedData")
# use the right filepaths from the unzipped data to read, reformat, and rename
# variables for both testing and training data
xtrain <- read.table(filepaths[27])
xtest <- read.table(filepaths[15])
xtrain1 <- tbl_df(xtrain)
xtest1 <- tbl_df(xtest)
features <- read.table(filepaths[2])
colnames(xtrain1) <- features$V2
colnames(xtest1) <- features$V2
# read the subject ID data into R and append it to the appropriate tables
subjecttrain <- read.table(filepaths[26])
subjecttest <- read.table(filepaths[14])
subjectIDstrain <- subjecttrain$V1
subjectIDstest <- subjecttest$V1
xtrain1$subjectid <- subjectIDstrain
xtest1$subjectid <- subjectIDstest
# read the activity ID data into R and append it to the appropriate tables
activitytrain <- read.table(filepaths[28])
activitytest <- read.table(filepaths[16])
activityIDstrain <- activitytrain$V1
activityIDstest <- activitytest$V1
xtrain1$activityid <- activityIDstrain
xtest1$activityid <- activityIDstest
# add indicator for which dataset the data belongs
xtrain1$sample <- "train"
xtest1$sample <- "test"
# combine the two datasets
testandtrain <- rbind(xtest1, xtrain1)

# Step 2 -- extract only measurements on mean and std for each measure
testandtrainSubset <- select(testandtrain,
                             c(grep("mean\\(\\)|std\\(\\)", features$V2)),562:564)

# Step 3 -- give descriptive activity names
testandtrainSubset <- testandtrainSubset %>% 
    mutate(activity = ifelse(activityid == 1, "walking",
                             ifelse(activityid == 2, "walking upstairs",
                                    ifelse(activityid == 3, "walking downstairs",
                                           ifelse(activityid == 4, "sitting",
                                                  ifelse(activityid == 5, "standing",
                                                         ifelse(activityid == 6, "laying", NA))))))) %>%
    select(-activityid)

# Step 4 -- label the data with descriptive variable names
finaldf1 <- testandtrainSubset
# remove special characters from variable names to make them easier to reference,
# then rename them with more descriptive variable names
names(finaldf1) <- gsub("-", "", names(testandtrainSubset)) %>%
    gsub(pattern = "\\(\\)", replacement = "") %>%
    # then rename them with more descriptive variable names
    gsub(pattern = "BodyAcc", replacement = "bodyAcceleration") %>%
    gsub(pattern = "GravityAcc", replacement = "gravityAcceleration") %>%
    gsub(pattern = "BodyGyro", replacement = "angularVelo") %>%
    gsub(pattern = "Mag", replacement = "Magnitude") %>%
    gsub(pattern = "^t", replacement = "") %>%
    gsub(pattern = "^f", replacement = "transformed") %>%
    gsub(pattern = "mean", replacement = "Mean") %>%
    gsub(pattern = "std", replacement = "StdDev")


# Step 5 -- from the dataset from Step 4, create a 2nd, independent tidy dataset 
# with the average of each variable for each activity and each subject
finaldf2 <- finaldf1 %>%
    group_by(activity, subjectid) %>%
    summarise_all(mean) %>%
    select(-sample)

write.table(finaldf2, "./tidyDataset.txt", row.names = FALSE)
