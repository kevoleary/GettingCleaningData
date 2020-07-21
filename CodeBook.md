# Code book

The original description of all the variables in the original dataset can be found at the bottom of this file. The first part of the file will focus on 
transformations made to these variables. The original descriptions contains the most detailed information on what each variable represents.

## Transformations
The data was transformed to create two independent tidy datasets. 
### Dataset 1
The first dataset made no changes to the underlying data, but instead focused on compiling
the data into one table and on renaming the variables. The only variables not included in the description below are "activity" and "subjectID". These also
came from data contained in the original zip. "activity" describes the activity being tracked, while "subjectID" gives a key that can be used to match the
subject whose activity was being tracked.

The variable names were updated to be more clear in the following ways:
1. Dashes and parantheses were removed
2. All instances of the phrase "BodyAcc" were replaced by "bodyAcceleration", and similarly "GravityAcc" was replaced by "gravityAcceleration"
3. All instances of "BodyGyro" were replaced by "angularVelo"
4. All instances of "Mag" were replaced by "Magnitude"
5. All leading "t"s were removed, and all leading "f"s were replaced by "transformed"
6. All instances of "mean" were capitalized to "Mean", and instances of "std" were replaced by "StdDev".

### Dataset 2
The second dataset has all of the same variables, but instead of representing individual observations, they are transformed to represent averages for each
type of observation grouped by activity and subject (i.e. each row contains a unique pair of activity and subject, and each column represents all the observations
for that pairing.




## Original description
### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth 
filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also 
the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.



Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

