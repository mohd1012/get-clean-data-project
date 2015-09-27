## load needed libraries

library(dplyr)

## read features namees and filter those for mean and std 
features<-read.table( "features.txt",stringsAsFactors=F,header=F)
str(features)
summary(features)
### index of mean & std features
index_mean_std<-grep("(-mean\\(\\))|(-std\\(\\))",features$V2)

### filter features for mean or std

col_headers<-features$V2[index_mean_std]
col_headers<-sub("\\(\\)","",col_headers)

col_headers<-gsub("-","_",col_headers)

# prepare test data
#=======================

## reads the values of the acivities
dftestX<-read.table( "test/X_test.txt",stringsAsFactors=F,header=F)
dptestX <- tbl_df(dftestX)

# select columns for mean & std
dpX <- select(dptestX,index_mean_std)
##
rm(dptestX)
# set column names
names(dpX)<- col_headers

# reads activity index & label & merge both
##activity index
activity_index<-read.table( "test/y_test.txt",stringsAsFactors=F,header=F)
sample_n(activity_index,5)
names(activity_index)<-c("index")
#label
activity_labels<-read.table( "activity_labels.txt",stringsAsFactors=F,header=F)
names(activity_labels)<-c("index","activity")
sample_n(activity_labels,4)

## merge activity_index &  activity_labelseade
activity<- merge(activity_index,activity_labels,by= c("index"))
sample_n(activity,3)
rm(activity_index)
## reads supjects who perform the activities
subjects <- read.table("test/subject_test.txt",stringsAsFactors=F,header=F)
names(subjects)<-c("subject")
sample_n(subjects,3)

## test data frame
df1<-cbind(activity,subjects,dpX)
dim(df1)
sample_n(df1,1)
## free memory
rm(subjects)
rm(dpX)


######################################
######################################

# prepare train data
#====================

## reads the values of the acivities
dftrainX<-read.table( "train/X_train.txt",stringsAsFactors=F,header=F)

dpX <- tbl_df(dftrainX)

# select columns for mean & std
dp_trainX <- select(dpX,index_mean_std)
# set column names
names(dp_trainX)<- col_headers

# reads activity index & label & merge both
##activity index
activity_index<-read.table( "train/y_train.txt",stringsAsFactors=F,header=F)
sample_n(activity_index,5)
names(activity_index)<-c("index")

#label is done in the previous stage
# activity_labels<-read.table( "activity_labels.txt",stringsAsFactors=F,header=F) 
# names(activity_labels)<-c("index","activity")
# sample_n(activity_labels,4)

## merge activity_index &  activity_labelseade
activity<- merge(activity_index,activity_labels,by= c("index"))
sample_n(activity,3)
rm(activity_index,activity_labels)
## reads supjects who perform the activities
subjects <- read.table("train/subject_train.txt",stringsAsFactors=F,header=F)
names(subjects)<-c("subject")
sample_n(subjects,3)

## test data frame
df2<-cbind(activity,subjects,dp_trainX)
dim(df2)
sample_n(df2,1)
## free memory
rm(dp_trainX)
rm(subjects)
rm(dpX)

## merge both train and test data

# sample_n(df1,2)
# sample_n(df2,2)
df1$index<- NULL
df2$index<- NULL
df3<-rbind(df1,df2)
rm(df1)
rm(df2)

##grouping by dplyr

raw_data <- tbl_df(df3)

tidy_data<-raw_data %>%group_by(activity,subject)%>%
          summarise_each(funs(mean))
rm(raw_data)
write.table(tidy_data, file = "tidy.txt", row.names = FALSE)
