#A. Set working ddirectory
setwd("~/Data Scientist/Projects/Project3")
#B. clear memory
rm(list=ls())

#C. create download directory
if (!file.exists("./data")) {
    dir.create("./data")
}

#D. set url and file name
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fname <- file.path("./data" , "dataset.zip")
dataDir <- file.path("./data" , "UCI HAR Dataset")

#E. downlad the file
if (!file.exists(fname)) {
    download.file(furl, destfile = fname);
}

#F. unzip if not already unzipped
if (!file.exists(dataDir)) {
    unzip(fname,exdir='./data')  
}

#G. get the individal files for train and stored them as data.frames
##G.1 get feature names to use as column headers for train and test data this is a data fram
featurenames <- read.table(file.path(dataDir,"features.txt"), col.names=c('id','name'),header=FALSE,stringsAsFactors=FALSE)

##G.2 traiing data with column name
data_train <- read.table(file.path(dataDir,"train", "X_train.txt"), col.names=featurenames$name, header=FALSE, stringsAsFactors=FALSE)
act_train<- read.table(file.path(dataDir,"train", "y_train.txt"), col.names='activitycode',header=FALSE, stringsAsFactors=FALSE)
sub_train <- read.table(file.path(dataDir,"train", "subject_train.txt"), col.names='subjectid',header=FALSE, stringsAsFactors=FALSE)

##G.3 test data with column names
data_test <- read.table(file.path(dataDir,"test", "X_test.txt"), col.names=featurenames$name, header=FALSE, stringsAsFactors=FALSE)
act_test <- read.table(file.path(dataDir,"test", "y_test.txt"), col.names='activitycode',header=FALSE, stringsAsFactors=FALSE)
sub_test <- read.table(file.path(dataDir,"test", "subject_test.txt"), col.names='subjectid',header=FALSE, stringsAsFactors=FALSE)

##G.4 get activity labels
activitylabel <- read.table(file.path(dataDir,"activity_labels.txt"), col.names=c('activitycode','activitydesc'),header=FALSE, stringsAsFactors=FALSE)

#1. Merges the training and the test sets to create one data set.
    train <- cbind(sub_train,act_train,data_train) #subject,activity, data
    test <- cbind(sub_test,act_test,data_test) #subject,activity, data
    datamerged <- rbind(train,test)
    
    ##remove individual data sets to save space
    rm(train)
    rm(test)
    rm(data_test)
    rm(data_train)
    rm(act_test)
    rm(act_train)
    rm(sub_test)
    rm(sub_train)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
##get the names of the colums that have mean() and stdev() total 33 variables as per readme
    ##ignoring meanfreq and other col names with mean
    ##get the posotion of columns from featurenames
    ### adding 2 to make compensae for subject and activity in datamerged table
    labelpostmean <- grep('mean\\(\\)',featurenames$name,value=F)+2
    labelpoststd <- grep('std\\(\\)',featurenames$name,value=F)+2
    
    ##merge position ids into a single vector add first two cols
    labelpost <- c(1:2,labelpostmean,labelpoststd)
    ##remove mean and std labels 
    rm(labelpoststd)
    rm(labelpostmean)
    
    ##extract data and remove the merged data set
    extdata <- datamerged[,labelpost]
    ##remove labelpost
    rm(labelpost)
    
#3.Uses descriptive activity names to name the activities in the data set
    extdata$activitycode <- as.factor(extdata$activitycode)
    levels(extdata$activitycode) <- activitylabel$activitydesc
    
    
#4.Appropriately labels the data set with descriptive variable names
    ##See section G for actvity names - included as part of the column names
    ##replace all the dots and convert all to lowercase 
    colnames(extdata) <-  gsub("\\.","",names(extdata))
    ##change mean to MEAN and std to STDEV
    descname <- names(extdata)
    descname <- gsub('std','STDEV',descname)
    descname <- gsub('mean','MEAN',descname)
    ##update Acc to Acceleration, Gyro to Gyroscope, mag to magnitude
    descname <- gsub('Acc','Acceleration',descname)
    descname <- gsub('Gyro','Gyroscope',descname)
    descname <- gsub('Mag','Magnitude',descname)
    colnames(extdata) <- descname
    
    
#5.From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable 
#for each activity and each subject (create in that order)
    library(dplyr)
    #create tidy data with subgroups subject id and actvitycode and mean of each 
    tidydata <- extdata %>% 
        group_by(activitycode,subjectid) %>% 
            summarize_each(funs(mean)) %>%
                arrange(activitycode,subjectid)

    #normalize the data round to 7 digits after decimal points
    tidydata <- cbind(tidydata[,1:2],lapply(tidydata[,3:68],signif,7))
    
    ##update the columns names adding avg to indicate this is a subgroup average
    colnames(tidydata) <- c('Activity','SubjectID',paste('avg',names(tidydata)[3:68], sep=''))
    
    
    #replaced BodyBodystring with Body to make more meaningful and in line with the features_info.txt
    colnames(tidydata) <- gsub('BodyBody','Body',names(tidydata))
    
    #generate the Txt file
    write.table(tidydata, "tidydata.txt",row.names=FALSE)

    message('Tidy data tidydata.txt ready for further analysis')