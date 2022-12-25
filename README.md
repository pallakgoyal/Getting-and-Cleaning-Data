# Getting-and-Cleaning-Data
This contains the work on a peer graded assignment. It showcases my ability to clean data using R software.

The file run_analysis.R contains the code used to accomplish the task. It also includes narration to explain what the code intends to do. Following is a brief description of the approach without going into the details of the individual functuions. Needless to say, the details of the functions can be examined in the code itself.

The zip archive folder was downloaded and unzipped into the working directory. A vector of column names was read into the environment. Two sparate dataframes were created for test and train type. These included the activity labels formulated into a readable format. The datasets were merged. A smaller data set containing only the means and standard deviations of all the measured variables was created. These were grouped by Activity type to obtain the final data set that can be found in this directory.
