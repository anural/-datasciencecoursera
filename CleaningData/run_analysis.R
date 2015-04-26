#merging test set
testXData<-read.table("./Dataset/test/X_test.txt",header=F)
testSubject<-read.table("./Dataset/test/subject_test.txt",header=F)
testYData<-read.table("./Dataset/test/y_test.txt",header=F)
mergedTest<-cbind(testSubject,testYData,testXData)

##merging train set
trainXData<-read.table("./Dataset/train/X_train.txt",header=F)
trainSubject<-read.table("./Dataset/train/subject_train.txt",header=F)
trainYData<-read.table("./Dataset/train/y_train.txt",header=F)
mergedTrain<-cbind(trainSubject,trainYData,trainXData)

#renaming the headers
features<-read.table("./Dataset/features.txt",header=F)
features<-cbind(c("subject","activity",as.character(features$V2)))

#merging all
totalSet<-rbind(mergedTest,mergedTrain)
#apply header names to total set
names(totalSet)<-c(as.character(features))
#removing () from column names
names(totalSet)<-gsub("\\(\\)","",names(totalSet))

#change activity codes to description
activities<-read.table("./Dataset/activity_labels.txt",header=F)
totalSet$activity<-as.factor(totalSet$activity)
activities$V2<-as.factor(activities$V2)
levels(totalSet$activity)<-c(levels(activities$V2))

#means and std columns only
meancols<-totalSet[,grep("mean\\b",colnames(totalSet))]
stdcols<-totalSet[,grepl("std",colnames(totalSet))]

#final set
finalSet<-cbind(totalSet[,1:2],meancols,stdcols)

#get aggregates by subject and activity
avgMeans<-with(finalSet, aggregate(x=meancols,by=list(subject,activity),FUN=mean))
avgStds<-with(finalSet, aggregate(x=stdcols,by=list(subject,activity),FUN=mean))

#result to write
result<-cbind(avgMeans,avgStds)


