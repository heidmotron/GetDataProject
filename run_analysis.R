main <- function() {
  df <- processData()
  df <- aggregate(. ~ subjectId + activity, df, FUN=mean)
  write.table(df, "tidy.txt", row.name=FALSE)
}

processData <- function() {
  activity <- processActivity()
  subjectId <- processSubjects()
  x <- processX()
  
  
  cbind(subjectId, activity, x)
}


processActivity <- function() {
  labels <- read.table('./data/activity_labels.txt', colClasses="character")[[2]]
  
  df <- read.table("data/test/y_test.txt")
  df2 <- read.table("data/train/y_train.txt")
  convert <- function(x) labels[x]
  
  c(sapply(df[[1]], convert), sapply(df2[[1]], convert)) 
}


processSubjects <- function() {
  df <- read.table("data/test/subject_test.txt")
  df2 <- read.table("data/train/subject_train.txt")
  
  c(df[[1]], df2[[1]])
}

processX <- function() {
  labels <- read.table("data/features.txt", colClasses="character")[[2]]

  labelIndices <- c(grep("mean()", labels, fixed=TRUE), grep("std()", labels, fixed=TRUE))
  labelNames <- labels[labelIndices]

   df <- read.table("data/test/X_test.txt")[,labelIndices]
   df2 <- read.table("data/train/X_train.txt")[,labelIndices]
   df <- rbind(df, df2)
   names(df) <- labelNames
  
  df
}


main()
