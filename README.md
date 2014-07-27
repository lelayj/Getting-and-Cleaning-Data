README
-------

### 0. Working directory

[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data used in this script.  
The working directory must be set so that  UCI HAR Dataset is a subdirectory of it.

### 1. The files that will be used

We will use the following files of the directory UCI HAR Dataset and of its subdirectories train and test :

activity_labels.txt  
features.txt  
subject_train.txt  
y_train.txt  
X_train.txt  
subject_test.txt  
y_test.txt  
X_test.txt

The function `read.table` reads a file in table format and creates a data frame from it. Thus applying `read.table` to the previous files will create the data frames that will be called as follows :

dfactivity_labels  
dffeatures  
dfsubject_train  
dfy_train  
dfX_train  
dfsubject_test  
dfy_test  
dfX_test

### 2. Getting information about the previous data frames

**using nrow, ncol, names, unique, length, printing some rows and columns for some data frames we obtain :**

* dfactivity_labels : 6 rows, 2 columns,  names of the columns: "V1" "V2"


```r
directory <- "UCI HAR Dataset"
filename <- "activity_labels.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
(dfactivity_labels <- read.table( destfile))
```

```
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING
```

* dffeatures : 561 rows, 2 columns,  names of the columns: "V1" "V2"


```r
directory <- "UCI HAR Dataset"
filename <- "features.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dffeatures <- read.table( destfile)
dffeatures[c(1,2,560,561),]
```

```
##      V1                   V2
## 1     1    tBodyAcc-mean()-X
## 2     2    tBodyAcc-mean()-Y
## 560 560 angle(Y,gravityMean)
## 561 561 angle(Z,gravityMean)
```


**The data frames read from the following files of the UCI HAR Dataset/train sub-directory concern  70% of the volunteers (those who were randomly selected for generating the train data).**

* dfsubject_train : 7352 rows, 1 column,  name of the column : "V1"

`unique(x)` returns a vector, data frame or array like x but with duplicate elements/rows removed.

```r
directory <- "UCI HAR Dataset/train"
filename <- "subject_train.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfsubject_train <- read.table( destfile)
unique(dfsubject_train)
```

```
##      V1
## 1     1
## 348   3
## 689   5
## 991   6
## 1316  7
## 1624  8
## 1905 11
## 2221 14
## 2544 15
## 2872 16
## 3238 17
## 3606 19
## 3966 21
## 4374 22
## 4695 23
## 5067 25
## 5476 26
## 5868 27
## 6244 28
## 6626 29
## 6970 30
```

```r
length(unique(dfsubject_train[,1]))
```

```
## [1] 21
```

this shows that the (only) column of the data frame dfsubject_train is made up of the study numbers (21 in total out of 30, with repetition) of the volunteers randomly selected for generating the training data (21/30 actually equals 70% of the volunteers), as mentioned in the 'README.txt' included in the provided data set :  
> 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* dfy_train : 7352 rows, 1 column,  name of the column : "V1"


```r
directory <- "UCI HAR Dataset/train"
filename <- "y_train.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfy_train <- read.table( destfile)
unique(dfy_train)
```

```
##     V1
## 1    5
## 28   4
## 52   6
## 79   1
## 126  3
## 151  2
```

```r
length(unique(dfy_train[,1]))
```

```
## [1] 6
```
this shows that the (only) column of the data frame dfy_train is made up of the 6 activity labels, with repetition.

For a same row number, 1 in the column of dfy_train and 1 in the column of dfsubject_train means that  the activity 1 was carried out by the subject 1 . Several rows show 1 and 1, due to the fact that there are several records for the subject 1 carrying out the  activity 1. And the same applies to the 6 activities, this for the 21 subjects.

* dfX_train : 7352 rows, 561 columns,  names of the columns : "V1"  "V2" ... "V560" "V561" corresponding to the 561 variables listed in features.txt

```r
directory <- "UCI HAR Dataset/train"
filename <- "X_train.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfX_train <- read.table( destfile)
dfX_train[c(1:2,7351:7352),c(1:2,560:561)]
```

```
##          V1       V2   V560     V561
## 1    0.2886 -0.02029 0.1799 -0.05863
## 2    0.2784 -0.01641 0.1803 -0.05432
## 7351 0.2897 -0.01884 0.2464  0.02534
## 7352 0.3515 -0.01242 0.2468  0.03669
```
A row of number n in dfX_train results from a series of calculations performed on the rows of number n in the nine files of UCI HAR Dataset/train/Inertial Signals. The data that appear on the rows of number n in these nine files correspond to the activity and the subject mentioned on the rows n of dfy_train and dfsubject_train, respectively. 


**The data frames read from the following files of the UCI HAR Dataset/test sub-directory concern  30% of the volunteers (those who were randomly selected for generating the test data).**

The same as what was  mentioned above apply to these data frames by replacing 7352 rows with 2947 rows and 21 subjects with 9 subjects.

The  data frames in question are : dfsubject_test, dfy_test, dfX_test

* dfsubject_test : 2947 rows, 1 column,  name of the column : "V1"

```r
directory <- "UCI HAR Dataset/test"
filename <- "subject_test.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfsubject_test <- read.table( destfile)
unique(dfsubject_test)
```

```
##      V1
## 1     2
## 303   4
## 620   9
## 908  10
## 1202 12
## 1522 13
## 1849 18
## 2213 20
## 2567 24
```

```r
length(unique(dfsubject_test[,1]))
```

```
## [1] 9
```
this shows that the (only) column of the data frame dfsubject_test is made up of the study numbers (9 in total out of 30 with repetition) of the volunteers randomly selected for generating the test data (9/30 actually equals 30% of the volunteers).

* dfy_test : 2947 rows, 1 column,  name of the column : "V1"

```r
directory <- "UCI HAR Dataset/test"
filename <- "y_test.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfy_test <- read.table( destfile)
unique(dfy_test)
```

```
##     V1
## 1    5
## 32   4
## 56   6
## 80   1
## 110  3
## 134  2
```

```r
length(unique(dfy_test[,1]))
```

```
## [1] 6
```
this shows that the (only) column of the data frame dfy_test is made up of the 6 activity labels, with repetition, corresponding to the activity which is carried out by the subject.

For a same row number, 1 in the column of dfy_test and 2 in the column of dfsubject_test means that the activity 1 was carried out by the subject 2. Several rows show 1 and 2, due to the fact that there are several records for the subject 2 carrying out the  activity 1. And the same applies to the 6 activities, this for the 9 subjects.

* dfX_test : 2947 rows, 561 columns,  names of the columns : "V1"  "V2" ... "V560" "V561" corresponding to the 561 variables listed in features.txt

```r
directory <- "UCI HAR Dataset/test"
filename <- "X_test.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfX_test <- read.table( destfile)
dfX_test[c(1:2,2946:2947),c(1:2,560:561)]
```

```
##          V1       V2   V560     V561
## 1    0.2572 -0.02329 0.2768 -0.05798
## 2    0.2860 -0.01316 0.2813 -0.08390
## 2946 0.2376  0.01847 0.2648  0.18756
## 2947 0.1536 -0.01844 0.2639  0.18810
```
A row of number n in dfX_test results from a series of calculations performed on the rows of number n in the nine files of UCI HAR Dataset/test/Inertial Signals.  The data that appear on the rows of number n in these nine files correspond to the activity and the subject mentioned on the rows n of dfy_test and dfsubject_test, respectively. 

### 3. Merging the training and the test sets to create one data set (Question 1)

Let DF be the data frame that will give the required data set.

dfy_train, dfsubject_train and dfX_train have the same number of rows (7352), so it is possible to use `cbind`. We'll call the result dftrain.

The same applies to dfy_test, dfsubject_test and dfX_test (2947 rows) : it is possible to use `cbind`, and we'll call the result dftest.

And then it is  possible to use `rbind` with dftrain and dftest because these two data frames have exactly the same number of variables (563) with exactly the same name sorted in the same way : "V1"  "V1"  "V1"  "V2" ... "V560" "V561", where the first two are the names of the sole columns of "dfy_" and "dfsubject_", and the last 561 ones correspond to the 561 variables listed in features.txt.


```r
dftrain <- cbind(dfy_train,dfsubject_train,dfX_train)
dftest <- cbind(dfy_test,dfsubject_test,dfX_test)
DF <- rbind(dftrain,dftest)
dim(DF)
```

```
## [1] 10299   563
```
If we had to write DF to a file, we would use `write.table` :

write.table(DF, file = "Course Project Data Set DF.txt", sep = ",",row.names = FALSE)

### 4. Replacing R non-allowed characters with  R allowed ones in features.txt  (part 1 /2 of Question 2)

Aiming to use some of the names of variables provided by features.txt (namely the names of the variables that indicate a mean or a standard deviation), we have first to replace R non-allowed characters seen  in the list of names with  R allowed ones: a-z,A-Z,0-9,«.»,«_».

We already know that the names of the columns of dffeatures are "V1" and "V2". What class has dffeatures$V2?

```r
class(dffeatures$V2)
```

```
## [1] "factor"
```
it has the class factor, so dffeatures$V2 has to be coerced to character type.

Let us use now the  function `gsub` : gsub(pattern, replacement, x, fixed = TRUE)  
where "pattern" is a character string to be matched as is (due to fixed = TRUE) in the given character vector x ( one element of dffeatures$V2 for our use), and "replacement" is a replacement for matched pattern

`gsub` returns a character vector of the same length and with the same attributes as x. Elements of the character vector x which are not substituted will be returned unchanged.

In order to replace R non-allowed characters with  R allowed ones, we will use the function `mapply` to apply the function `gsub` to pattern = "-", replacement = "_", x = each element of dffeatures$V2 in turn, fixed = TRUE

and we will do the same for  
pattern = ",", replacement = "_"  
pattern = "(", replacement = "."  
pattern = ")", replacement = ""

### 5. Extracting only the measurements on the mean and standard deviation for each measurement  (part 2 /2 of Question 2)

Since in DF the first two  columns correspond to the sole columns of "dfy_" and "dfsubject_", and the last 561 ones correspond to the 561 elements of dffeatures$V2, we will search in dffeatures$V2 the names of variables that contain the character string "mean." or "std.". (Those with "mean." indicate a mean, unlike for instance fBodyAcc_meanFreq._X that indicates a frequency on fBodyAcc_mean._X)

We will achieve this through the `grepl` function that returns a logical vector : match or not for each element of dffeatures$V2 (fixed = TRUE : use exact matching).

Then
```
DFms <- DF[ , c(TRUE,TRUE,occurrences)]
```
will give the required extract of DF composed of the sole columns of "dfy_" and "dfsubject_", kept thanks to TRUE, TRUE, and of only the measurements on the mean and standard deviation for each measurement, extract called DFms.

dim(DFms) would give 10299 rows and 68 columns

### 6. Appropriately labeling the data set with descriptive variable names (Question 4)

In order to label this data set with descriptive variable names, we will replace :  
BodyAcc with BodyLinearAcceleration, GravityAcc with GravityAcceleration,
Gyro with AngularVelocity, Mag with Magnitude, std with standardDeviation, 
and at last BodyBody with Body where needed. It does actually seem that there is a mistake in the names of the given list of dffeatures from index 516 to index 554 : each of these contain BodyBody instead of, most probably, Body... 

### 7. Using descriptive activity names to name the activities in the data set (Question 3)

The  function `replaceNbWithStr` is created with the aim of replacing the activity labels with the activity names. It applies to any integer between 1 and 6. We will use the function `mapply` to apply the previous one to each element of the column "activity" of DFms for the labels to be replaced with the names of the activities.

### 8. Creating a second, independent tidy data set with the average of each variable for each activity and each subject (Question 5)

This tidy data set will be created from the previous one "DFms".

We will split DFms into groups (dataframes) determined by the factor f  "interaction" of the columns "activity" and "subject" of DFms as factors : 
```
f <- interaction(DFms$activity,DFms$subject, lex.order = TRUE)  
s <- split(DFms,f)
```
We  use  `interaction` with :  
lex.order = TRUE : the levels are lexically ordered as follows : 

LAYING.1 | LAYING.2 | LAYING.3 | ... | LAYING.29 | LAYING.30  
SITTING.1 | SITTING.2 | SITTING.3 | ... | SITTING.29 | SITTING.30  
then STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS  
as far as WALKING_UPSTAIRS.30, giving 6 x 30 = 180 levels (note : each factor level is used).

The groups will be ordered according to this order since they are named by the levels and ranked in their order, this due to the `split` function.  

(note : we would only need to switch "activity" for "subject" in `interaction` to get levels in the form of "subject.activity" lexically ordered.)

ncol(DFms) = 68, so each group is a dataframe of 68 columns. We calculate  the mean of each of the last 66 columns for each group : 
```
tdfaverage <- sapply(s, function(group) colMeans(group[,3:ncol(DFms)]))
```
`sapply` returns here a matrix with 66 (= 68-2) rows and 180 columns, so that

the names of the columns are made of the 180 levels, lexically ordered,  
the names of the rows are made of the last 66 names of the columns of DFms (in the same order), those of dffeatures$V2 indicating a measurement on the mean and standard deviation for each measurement.  
Each column is made of the averages of these 66 variables for a given group.

We have to transpose tdfaverage to get back the names of the rows as names of columns as they were in DFms : 
```
dfaverage <-t(tdfaverage)
```
dfaverage is a matrix with 180 rows and 66 columns.

We appropriately name the variables of dfaverage appending "_average" to the previous 66 names.

We remove the row names, which are currently the levels.

We place the six activities in alphabetic order.

And we can now obtain the tidy data set with the average of each variable for each activity and each subject doing so :
```
DFaverage <- data.frame(activity=rep(activities_sorted,each=30),subject=rep(1:30,6), dfaverage)
write.table(DFaverage, file = "Course Project Tidy Data Set.txt", sep = ",",row.names = FALSE)
```

