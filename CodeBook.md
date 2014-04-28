This Codebook describes the data transformations which have been performed to process the raw data for further analysis. For information about the raw data, authors of the original data set and experimental setup, please refer to Human Activity Recognition Using Smartphones Data Set.

Data Transformations

Merging Training and Test Data

Let k be the number of training examples, l the number of test examples and m the number of features. Then the data will be merged in a [(k+l), m+2] dataframe. This dataframe combines the training and test data and contains the numeric subject and activity labels in the its first two columns.

Feature Extraction

From the identifiers in the feature vector, the characters "(", ")" are removed, while the characters "," and "-" are replaced with underscores. After this preprocessing step all features with names containing the words "subject", "activity label", "Mean", "mean" and "std" are extracted.

Grouping and Averaging

The dataset is stacked vertically and the grouped by subject and activity labels. After that the mean function is applied to each variable and activity for each subject.
