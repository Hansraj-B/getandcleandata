#DATA DICTIONARY FOR tidydata

###August 2016

###Can be read with read.table

##Transformations on source data (Refer to README.md for more details)
* Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Training data merged X_train.txt, y_train.txt, Subject_train.txt
* Test data merged X_test.txt, y_test.txt, Subject_test.txt
* training and test data merged (appended rows)
* Column headings from the features.txt applied to merged data
* All column heading with mean() and std() extracted - these correspond to 33 variables as defined in the readme.txt
* Converted subjectid to a 1-6 level factor and applied Activity Labels as factor levels
* Updated column named from mean to MEAN, std to STDEV, gyro to Gyroscope, Acc to acceleration, Mag to Magnitude
* changed column names with BodyBody to Body and removed all dots from column names
* Aggregated data with Activity and SubjectID group by and mean of all variables are the summary
* tidydata crated and all column names updated to prefix avg to show that they are grouped means
* tidydata ordered on Activity and Subjectid

#Group Variables

##Activity 1

####Represents the type of activity peformed by the subject during reading
        Factor with 6 Levels [1-6]
            1. "WALKING"
            2. "WALKING_UPSTAIRS"
            3. "WALKING_DOWNSTAIRS"
            4. "SITTING"
            5. "STANDING"          
            6. "LAYING"   
##SubjectID integer

####Represents the subject identification
        1 - Subject 1
        2 - Subject 2...
        1..30

#Measurement variables

The following measures are mean values of subgroups obtained from each Activity and SubjectID combination.
All measurements are rounded to 7 Decimals points
        0.0000000 or -0.0000000

####Means and standard deviation derived from the variable with Mean()and Std() in the column names of the original source data. Refer to the run_analysis.R for details on the conversion.

####Prefix **avg** is for all subgrouped means 

e.g. **avg**fBodyAccelerationMagnitude...

####Prefix **t** corresponds to data sampled from raw data at a constant frequency of 50 Hz

e.g. avg**t**BodyAccelerationSTDEVX 

####Prefix **f** implies fourier transformation has been applied to the signals

e.g.avg**f**BodyGyroscopeJerkMagnitudeMEAN   

####Suffix **X** or **Y** or **Z** implies reading is for the corresponding axis

e.g.    avgtBodyAccelerationMEAN**X**, avgtBodyAccelerationMEAN**Y**, avgtBodyAccelerationMEAN**Z**

####Suffix **MEAN** or **STDEV** corresponds to the Mean or Standard Deviation of respective signal

e.g.    avgtBodyAcceleration**MEAN**X, avgtBodyAcceleration**STDEV**X 
        

##Signals measured on XYZ Axis

The following variables are signals that are measured on all 3-axis

#####**BodyAcceleration** - Body acceleration component separated from the raw accelerometer signal using low pass Butterworth filter with a corner frequency of 0.3 Hz. 

#####**GravityAcceleration** - Gravity acceleration component separated from the raw accelerometer signal using low pass Butterworth filter with a corner frequency of 0.3 Hz. 

#####**BodyGyroscope** - Dervied from Gryoscope signals providing angular velocity

#####**BodyAccelerationJerk** - Jerk signals are derived in time from the body linear acceleration

#####**BodyGyroscopeJerk** - Jerk signals are derived in time from the angular velocity

##Magnitude Signals - dervied from the three-dimensional signals using the Euclidean norm
#####avgfBodyAccelerationJerkMagnitude, avgfBodyAccelerationMagnitude, avgfBodyGyroscopeJerkMagnitude, avgfBodyGyroscopeMagnitude, avgtBodyAccelerationJerkMagnitude, avgtBodyAccelerationMagnitude, avgtBodyGyroscopeJerkMagnitude, avgtBodyGyroscopeMagnitude, avgtGravityAccelerationMagnitude

#Data Dictionary
#####**avgtBodyAccelerationMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAcceleration along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAcceleration along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAcceleration along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  GravityAcceleration along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  GravityAcceleration along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  GravityAcceleration along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerk along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerk along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerk along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscope along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscope along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscope along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeJerk along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeJerk along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeJerk along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  GravityAccelerationMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerkMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeJerkMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgfBodyAccelerationMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAcceleration along X axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAcceleration along Y axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAcceleration along Z axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerk along X axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerk along Y axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerk along Z axis fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeMEANX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscope along X axis fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeMEANY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscope along Y axis fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeMEANZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscope along Z axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationMagnitude fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyAccelerationJerkMagnitude fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeMagnitude fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeJerkMagnitudeMEAN** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for MEAN of Signal  BodyGyroscopeJerkMagnitude fourier transformation has been applied to the signals
#####**avgtBodyAccelerationSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAcceleration along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAcceleration along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAcceleration along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal GravityAcceleration along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal GravityAcceleration along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal GravityAcceleration along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerk along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerk along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerk along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscope along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscope along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscope along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeJerk along X axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeJerk along Y axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeJerk along Z axis data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtGravityAccelerationMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal GravityAccelerationMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyAccelerationJerkMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerkMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgtBodyGyroscopeJerkMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeJerkMagnitude data sampled from raw data at a constant frequency of 50 Hz
#####**avgfBodyAccelerationSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAcceleration along X axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAcceleration along Y axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAcceleration along Z axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerk along X axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerk along Y axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerk along Z axis fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeSTDEVX** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscope along X axis fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeSTDEVY** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscope along Y axis fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeSTDEVZ** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscope along Z axis fourier transformation has been applied to the signals
#####**avgfBodyAccelerationMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationMagnitude fourier transformation has been applied to the signals
#####**avgfBodyAccelerationJerkMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyAccelerationJerkMagnitude fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeMagnitude fourier transformation has been applied to the signals
#####**avgfBodyGyroscopeJerkMagnitudeSTDEV** - (0.0000000 or -0.0000000):Subgroup mean of subgroup of Activity and Subject combination for Standard Deviation of Signal BodyGyroscopeJerkMagnitude fourier transformation has been applied to the signals
