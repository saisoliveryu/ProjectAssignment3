#import names of the 561 measurements 
features<- read.table("features.txt")
#extract variables indices and names on mean and standard deviation
ms<-features[grep("mean|std",features$V2),]

#import testing datasets
testsub <- read.table("subject_test.txt")
testset<- read.table("X_test.txt")
testlabel<- read.table("y_test.txt")
names(testsub)<-"subject"
names(testlabel)<-"activity"
names(testset)<-features$V2
#subset the data according to the indices
testsetms<- testset[,ms$V1] 
#combine the testing datasets
testcombined<-cbind(testsub,testlabel,testsetms)

#import testing datasets
trainsub <- read.table("subject_train.txt")
trainset<- read.table("X_train.txt")
trainlabel<- read.table("y_train.txt")
names(trainsub)<-"subject"
names(trainlabel)<-"activity"
names(trainset)<-features$V2
#subset the data according to the indices
trainsetms <- trainset[,ms$V1]
#combine the training datasets
traincombined<-cbind(trainsub,trainlabel,trainsetms)

#combine the testing and training data
totalset <- rbind(testcombined,traincombined)
#filter out variables that's not the mean of measurements
totalset<-totalset[,-grep("meanFreq",names(totalset))]
#rename the activities in the dataset
totalset$activity <- sub("1","walking",totalset$activity)
totalset$activity <- sub("2","walkingupstairs",totalset$activity)
totalset$activity <- sub("3","walkingdownstairs",totalset$activity)
totalset$activity <- sub("4","sitting",totalset$activity)
totalset$activity <- sub("5","standing",totalset$activity)
totalset$activity <- sub("6","laying",totalset$activity)

#rename the variables to descriptive names
names(totalset)<-sub("Acc","accelaration",names(totalset))
names(totalset)<-sub("Gyro","gyroscope",names(totalset))
names(totalset)<-sub("Mag","magnitude",names(totalset))

#calculate mean of each measurement for each activity of each subject
s<-split(totalset,list(totalset$subject,totalset$activity))
average<-lapply(s, function(x) colMeans(x))
