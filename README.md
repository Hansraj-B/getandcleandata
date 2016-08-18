## Overview

Getting and Cleaning Data Course Project: This README document explains the working of the **run_analysis.R** script. The entire script is run progressively until the final output **tidydata.txt** is created. The steps and the code snippets below explain the process.

##0. Setting up the environment and downloading data

###A. Set the working directory - optional
```
setwd("~/Data Scientist/Projects/Project3")
```

###B. clear memory to avoid out of memory
```
rm(list=ls())
```

###C. create download directory
```
if (!file.exists("./data")) {
    dir.create("./data")
}
```

###D. set url and file name
```
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fname <- file.path("./data" , "dataset.zip")
dataDir <- file.path("./data" , "UCI HAR Dataset")
```

###E. download the source data file
```
if (!file.exists(fname)) {
    download.file(furl, destfile = fname);
}
```

###F. unzip if not already unzipped
```
if (!file.exists(dataDir)) {
    unzip(fname,exdir='./data')  
}
```

###G. Get the individal files for train and stored them as data.frames

####G.1 Get feature names to use as column headers for train and test data
```
featurenames <- read.table(file.path(dataDir,"features.txt"), col.names=c('id','name'),header=FALSE,stringsAsFactors=FALSE)
```
####G.2 Get training data (data, activity, subject) with column name obtained from features
```
data_train <- read.table(file.path(dataDir,"train", "X_train.txt"), col.names=featurenames$name, header=FALSE, stringsAsFactors=FALSE)
act_train<- read.table(file.path(dataDir,"train", "y_train.txt"), col.names='activitycode',header=FALSE, stringsAsFactors=FALSE)
sub_train <- read.table(file.path(dataDir,"train", "subject_train.txt"), col.names='subjectid',header=FALSE, stringsAsFactors=FALSE)
```

####G.3 Get test data (data, activity, subject) with column name obtained from features####
```
data_test <- read.table(file.path(dataDir,"test", "X_test.txt"), col.names=featurenames$name, header=FALSE, stringsAsFactors=FALSE)
act_test <- read.table(file.path(dataDir,"test", "y_test.txt"), col.names='activitycode',header=FALSE, stringsAsFactors=FALSE)
sub_test <- read.table(file.path(dataDir,"test", "subject_test.txt"), col.names='subjectid',header=FALSE, stringsAsFactors=FALSE)
```

####G.4 Get activity labels, set column names here
```
activitylabel <- read.table(file.path(dataDir,"activity_labels.txt"), col.names=c('activitycode','activitydesc'),header=FALSE, stringsAsFactors=FALSE)
```

##1. Merge the training and the test sets to create one data set
####use bind instead of merge to avoid scrambling the order or data
```
    train <- cbind(sub_train,act_train,data_train) #subject,activity, data
    test <- cbind(sub_test,act_test,data_test) #subject,activity, data
    datamerged <- rbind(train,test)
    
```  
####Optional - remove individual data sets to save space

```
    rm(train)
    rm(test)
    rm(data_test)
    rm(data_train)
    rm(act_test)
    rm(act_train)
    rm(sub_test)
    rm(sub_train)
```

##2. Extract only the measurements on the mean and standard deviation for each measurement.
####get the names of the colums that have mean() and stdev(), a total 33 variables as per readme therefore ignoring meanfreq and other col names with mean
```
    ##get the posotion of columns from featurenames
    ### adding 2 to make compensate for subject and activity in datamerged table
    ###note use of escape characters \\ for ( and )
    labelpostmean <- grep('mean\\(\\)',featurenames$name,value=F)+2
    labelpoststd <- grep('std\\(\\)',featurenames$name,value=F)+2
    
    ##merge position ids into a single vector add first two cols to account for 
    labelpost <- c(1:2,labelpostmean,labelpoststd)
    
    ##remove mean and std labels - optional
    rm(labelpoststd)
    rm(labelpostmean)
    
    ##extract data and remove the merged data set
    extdata <- datamerged[,labelpost]
    
    ##remove labelpost optional
    rm(labelpost)
```

##3. Set descriptive activity names to name the activities in the data set
```
    extdata$activitycode <- as.factor(extdata$activitycode)
    levels(extdata$activitycode) <- activitylabel$activitydesc
``` 
    
##4. Appropriately labels the data set with descriptive variable names
####See section G for column names - included as part of the column names
```
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
    
    ##update the columns names
    colnames(extdata) <- descname
```

##5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject (create in that order)
####tidydata has each variable in one column, each observation in one row, column heading exists and are human readable
```
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
    
    
    #replace BodyBodystring with Body to make more meaningful and in line with the features_info.txt
    colnames(tidydata) <- gsub('BodyBody','Body',names(tidydata))

```
####Generate the txt file for upload can be read with read.table
```
    write.table(tidydata, "tidydata.txt",row.names=FALSE)
```
    
####Output completion message to console
```
 message('Tidy data tidydata.txt ready for further analysis')
```
