## Download and process UCI HAR Dataset, producing a tidy dataset with the mean
# of all -mean() and -std() variables, as well as a codebook with all column
# names.
## Download raw data
data_dir <- "."

## import labels
labels <- read.table(paste(data_dir, "UCI HAR Dataset", "activity_labels.txt", sep="/"),
                     col.names=c("labelcode","label"))
## import features
features <- read.table(paste(data_dir, "UCI HAR Dataset", "features.txt", sep="/"))
# determine important features
wanted_feature_indices <- grep("mean\\(|std\\(", features[,2])
## import training set
training_folder <- paste("data", data_dir, "train", sep="/")
training_subject <- read.table(paste(training_folder, "subject_train.txt", sep="/"),
                               col.names = "subject")
training_data <- read.table(paste(training_folder, "X_train.txt", sep="/"),
                            col.names = features[,2], check.names=FALSE)
training_data <- training_data[,wanted_feature_indices]
training_labels <- read.table(paste(training_folder, "y_train.txt", sep="/"),
                              col.names = "labelcode")
dftraining = cbind(training_labels, training_subject, training_data)
## import test set
test_folder <- paste("data", data_dir, "test", sep="/")
test_subject <- read.table(paste(test_folder, "subject_test.txt", sep="/"),
                           col.names = "subject")
test_data <- read.table(paste(test_folder, "X_test.txt", sep="/"),
                        col.names = features[,2], check.names=FALSE)
test_data <- test_data[,wanted_feature_indices]
test_labels <- read.table(paste(test_folder, "y_test.txt", sep="/"),
                          col.names = "labelcode")
dftest = cbind(test_labels, test_subject, test_data)
## merge datasets
df <- rbind(dftraining, dftest)
## replace label codes with the label
df = merge(labels, df, by.x="labelcode", by.y="labelcode")
df <- df[,-1]
## reshape the array
library(reshape2)
molten <- melt(df, id = c("label", "subject"))
## produce the tidy dataset with mean of each variable
## for each activyt and each subject
tidy <- dcast(molten, label + subject ~ variable, mean)
## write tidy dataset to disk
write.table(tidy, file="HARUSD_means.txt", quote=FALSE, row.names=FALSE, sep="\t")
## write codebook to disk
write.table(paste("* ", names(tidy), sep=""), file="CodeBook.md", quote=FALSE,
            row.names=FALSE, col.names=FALSE, sep="\t")
