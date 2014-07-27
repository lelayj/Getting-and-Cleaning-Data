# README 0.Working directory

# README 1.The files that will be used

directory <- "UCI HAR Dataset"
filename <- "activity_labels.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfactivity_labels <- read.table( destfile)

directory <- "UCI HAR Dataset"
filename <- "features.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dffeatures <- read.table( destfile)

directory <- "UCI HAR Dataset/train"
filename <- "subject_train.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfsubject_train <- read.table( destfile)

directory <- "UCI HAR Dataset/train"
filename <- "y_train.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfy_train <- read.table( destfile)

directory <- "UCI HAR Dataset/train"
filename <- "X_train.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfX_train <- read.table( destfile)

directory <- "UCI HAR Dataset/test"
filename <- "subject_test.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfsubject_test <- read.table( destfile)

directory <- "UCI HAR Dataset/test"
filename <- "y_test.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfy_test <- read.table( destfile)

directory <- "UCI HAR Dataset/test"
filename <- "X_test.txt"        
destfile <- paste("./",directory,"/",filename,sep="") 
dfX_test <- read.table( destfile)

# README 2.Getting information about the previous data frames

# README 3.Merging the training and the test sets to create one data set

# Let DF be the data frame that will give the required data set.

dftrain <- cbind(dfy_train,dfsubject_train,dfX_train)
dftest <- cbind(dfy_test,dfsubject_test,dfX_test)
DF <- rbind(dftrain,dftest)

# README 4.Replacing R non-allowed characters with  R allowed ones in features.txt

dffeatures$V2 <- as.character(dffeatures$V2)

dffeatures$V2 <- mapply(gsub,"-","_",dffeatures$V2,fixed = TRUE)
dffeatures$V2<- mapply(gsub,",","_",dffeatures$V2,fixed = TRUE)
dffeatures$V2 <- mapply(gsub,"(",".",dffeatures$V2,fixed = TRUE)
dffeatures$V2 <- mapply(gsub,")","",dffeatures$V2,fixed = TRUE)

# README 5.Extracting only the measurements on the mean and standard deviation
#          for each measurement

occur_mean <-  grepl("mean.", dffeatures$V2, fixed = TRUE)
occur_std <-  grepl("std.", dffeatures$V2,  fixed = TRUE)
occurrences <- occur_mean | occur_std

# Let DFms be the required extract 
DFms <- DF[ , c(TRUE,TRUE,occurrences)]

# README 6.Appropriately labeling the data set with descriptive variable names

names(DFms) <- c("activity","subject",dffeatures$V2[occurrences])

names(DFms)[3:ncol(DFms)] <- mapply(gsub,"BodyAcc","BodyLinearAcceleration",names(DFms)[3:ncol(DFms)],fixed = TRUE)
names(DFms)[3:ncol(DFms)] <- mapply(gsub,"GravityAcc","GravityAcceleration",names(DFms)[3:ncol(DFms)],fixed = TRUE)
names(DFms)[3:ncol(DFms)] <- mapply(gsub,"Gyro","AngularVelocity",names(DFms)[3:ncol(DFms)],fixed = TRUE)
names(DFms)[3:ncol(DFms)] <- mapply(gsub,"Mag","Magnitude",names(DFms)[3:ncol(DFms)],fixed = TRUE)
names(DFms)[3:ncol(DFms)] <- mapply(gsub,"std","standardDeviation",names(DFms)[3:ncol(DFms)],fixed = TRUE)
names(DFms)[3:ncol(DFms)] <- mapply(gsub,"BodyBody","Body",names(DFms)[3:ncol(DFms)],fixed = TRUE)

# README 7.Using descriptive activity names to name the activities in the data set

replaceNbWithStr <- function(x){
        
        if (!is.element(x,1:6)){
                stop("argument x must be in 1:6 only")
        }
        
        else {if (x==1){return("WALKING")}
              if (x==2){return ("WALKING_UPSTAIRS")}          
              if (x==3){return ("WALKING_DOWNSTAIRS")}
              if (x==4){return ("SITTING")}
              if (x==5){return ("STANDING")}
              if (x==6){return ("LAYING")}
        }       
}

DFms$activity <- mapply(replaceNbWithStr,DFms$activity)
# the labels of DFms$activity are now replaced with the names of the activities.

# README 8.Creating a second, independent tidy data set with the average 
#          of each variable for each activity and each subject

f <- interaction(DFms$activity,DFms$subject, lex.order = TRUE)

s <- split(DFms,f)

tdfaverage <- sapply(s, function(group) colMeans(group[,3:ncol(DFms)]))

dfaverage <-t(tdfaverage)

colnames(dfaverage) <- paste(colnames(dfaverage),"_average",sep="")

rownames(dfaverage) <- NULL

activities_sorted <- sort(dfactivity_labels$V2)

# the tidy data set  with the average  of each variable for each activity
# and each subject is the following:

DFaverage <- data.frame(activity=rep(activities_sorted,each=30),subject=rep(1:30,6), dfaverage)
write.table(DFaverage, file = "Course Project Tidy Data Set.txt", sep = ",",row.names = FALSE)
