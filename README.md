# ProjectAssignment3
Project assignment for Getting and Cleaning Data Course at Coursera by JHU

For the codes giving rise to the final clean data after step 5 as in the assignment instruction,
please refer to the CodeBook.md.

Following the instruction, I imported the 6 txt files of testing and training data.
The column names of them were reset to reflect the real meanings and then measurements other than 
mean and standard deviations were filtered out by grep().

After combining the two datasets, I replaced the numbers in Activity with the real activity names and
replaced the abbreviations in variable names with real meanings.

Finally, the mean of each measurement for each activity of each subject was calculated with
split() and lapply().
