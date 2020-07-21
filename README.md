# GettingCleaningData
This repository contains a script in the file run_analysis.R that downloads data from the internet and compiles it into a pair of tidy datasets,
the second of which it prints out to a file named tidyDataset.txt. The remaining files in this repository are folders containing the data
that was downloaded in run_analysis.R. 

The run_analysis.R script follows the following steps:

1. It installs and loads the "dplyr" package that is used extensively throughout the script, then downloads the data from the internet and extracts it from
its zip file.
2. It uses the filepaths from the unzipped data to read, reformat, and rename variables for both the testing and training data.
3. It reads the subject ID data into R and append it to the appropriate tables.
4. It reads the activity ID data into R and append it to the appropriate tables
5. It adds indicator to display which dataset the data belongs to.
6. It combines the testing and the training datasets into one master dataset.
7. It extracts only measurements on mean and standard deviation for each measure.
8. It gives each activity a descriptive name instead of relying on the activity IDs.
9. It labels all the variables with more descriptive names, first by removing special characters and then by replacing key phrases with clearer wordings.
10. Finally, it uses the group_by() and summarise_all() functions to create a second tidy dataset grouped by activity and subject ID, containing the 
averages for all variables, and writes this second dataset out to the tidyDataset.txt file.
