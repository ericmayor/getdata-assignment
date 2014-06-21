# Overview of the script
For the training data and then the test data: The script first each of the measurement files to R and creates a flat version of the data which is assigned to a vector, for each measurement.
It then created a dataframe with the data on all variables, adds colnames, and a new variable which identifies the origin of the data (train or test).

After the training and test data are merged, named and identified, they are merged using rbind.

The resulting data frame is written to disk.

The script the computes the mean and sd of all variables.