# datasciencecoursera-getting-and-cleaning-data-course-project-run_analysis.R
Clone this repository, make the repository your work directory and get and unzip the following archive:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Run R and source the script run_analysis.R.

The script reads data sets from the UCI HAR Dataset folder that you extracted from the downloaded archive. The data sets are combined and labelled with descriptive variable names. All mean and standard deviation measurements, i.e. all measurements that contain "mean" or "std" in lower or upper case in their name, are extracted from the data. The activity labels (1-6) are mapped to the respective activity names. The extracted measurements are grouped by subject and activity and aggregated with the mean function. The aggregated data is written to a file named tidy.txt.
