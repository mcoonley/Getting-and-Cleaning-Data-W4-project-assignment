##download file
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURl,destfile = "./R program and studio directory")
## unzip data 

## 1) Merge the training and test sets to create one data set

##read in all necessary data
testdata<-read.table("./test/X_test.txt")
testdatAct<-read.table("./test/y_test.txt")
testSub<-read.table("./test/subject_test.txt")
traindata<-read.table("./train/X_train.txt")
traindatAct<-read.table("./train/y_train.txt")
trainSub<-read.table("./train/subject_train.txt")
features<-read.table("./features.txt")
act_labels<-read.table("./activity_labels.txt")

## combine test and training data
testtrain<-rbind(testdata, traindata)

## check data
str(testtrain)

## 2) Extract only the measurements on the mean and standard deviation for each 
##    measurement

## transpose features from columns of data to rows
## load data.table package to use transpose()
library(data.table)
tfeatures<-transpose(features)
##change testtrain column names using tfeatures
colnames(testtrain)=tfeatures[2,]
##parameters to select only columns with mean and std
mean_std <- grep("-(mean|std)\\(\\)", tfeatures)
## select only columns with mean and std
testtrain1<-testtrain[,mean_std]

## 3) Use descriptive activity names to name the activities in the data set

##combine test and train subject and activity information
ttsub<-rbind(testSub, trainSub)
ttAct<-rbind(testdatAct, traindatAct)

##combine subject, activity and mean & standard deviation data
testtrain2<-cbind(ttsub,ttAct,testtrain1)

## change subject and activity column names for testtrain
colnames(testtrain2)[1]<-"subject"
colnames(testtrain2)[2]<-"activity"


## change activity labels
act_labels<-c("walking","walking_upstairs","walking_downstairs", 
              "sitting", "standing","laying")
testtrain2$activity<-gsub(1, act_labels[1], testtrain2$activity)
testtrain2$activity<-gsub(2, act_labels[2], testtrain2$activity)
testtrain2$activity<-gsub(3, act_labels[3], testtrain2$activity)
testtrain2$activity<-gsub(4, act_labels[4], testtrain2$activity)
testtrain2$activity<-gsub(5, act_labels[5], testtrain2$activity)
testtrain2$activity<-gsub(6, act_labels[6], testtrain2$activity)

## 4)  Appropriately label the data set with descriptive variable names.
names(testtrain2)<-gsub("\\(\\)","", names(testtrain2))
names(testtrain2)<-gsub("^(t)","Time_", names(testtrain2))
names(testtrain2)<-gsub("^(f)","Frenquency_", names(testtrain2))
names(testtrain2)<-gsub("BodyBody","Body", names(testtrain2))
names(testtrain2)<-gsub("-","_", names(testtrain2))
## 5) From data set in step 4, create a second, independent tidy data set with the 
##    average of each variable for each activity and each subject
library(reshape2)
tt2<-melt(testtrain2, id= c("subject","activity"))
tt2Mean<-dcast(tt2, subject + activity ~ variable, mean)
write.table(tt2Mean, "c:/users/..../tidydata.txt", row.names= FALSE, quote = FALSE)
