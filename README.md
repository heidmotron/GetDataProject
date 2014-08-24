# Tidy dataset from the Human Activity Recognition Using Smartphones Dataset

The goal of this analysis is to produce the mean of each activity per subject using observations from ***Human Activity Recognition Using Smartphones Dataset (HARUS)***. Analysis is only over 66 of the more than 500 variables HARUS. These variables were selected by either having `"mean()"` or `"std()"` in their variable name.


### Running the script

In order to run the script, there is an assumption that the data has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into the working directory of the script and the folder has been renamed to data.


```
git clone https://github.com/heidmotron/GetDataProject.git
cd GetDataProject
mv <unzipped_downloadeddata> data
r run_analysis.R
```


### What the script does

* Processes the activity data (y_<test|train>.txt) in test & train by converting the numeric integers in to string labels from activity_labels.txt and concatenates the two files together as one character vector
* Processes the subject data by concatentating the train & text (subject.txt) files in an integer vector
* Given the features.txt, grep is run for mean() and std() and returns the indices & names for the selected variables.
* The feature indices are then used select to create new data frames from text and train x.txt files and are concatenated together
* All three data sets are then combined by column into a new data and aggregated by subjectId & activity
* Finally the new data frame is written to a file named "tidy.txt" in the working directory


