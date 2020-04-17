#!/bin/bash

#Author – Debasmita DasGupta
#Version – 1.0
#Descritpion – This shell script will add an extension “.new” to all the files in the user specified directory

#This function is responsible for adding an extension “.new” to all the files under the user provided Directory.
function changeFileExtension()
{
cd $1
ERROR_CODE=$(echo $?)
ERROR_MSG=$(echo $?)
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue in navigating to the provided directory \"$1\". The Error Code is: $ERROR_CODE. The Error Message is: $ERROR_MSG”
exit 1
else
for file in *
do
mv $file `basename $file `.new
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue in changing the extention of the file \"$file\". The Error Code is: $ERROR_CODE. The Error Message is: $ERROR_MSG”
exit 1
else
echo “The File extension have been successfully modified for the file \"$file\".”
fi
done
fi
}

#This snippet is responsible for taking the user input.
while [ -z $dirName ]
do
echo -e “Please enter the \"Absolute Path\" \(for example /directory1/directory2/directory3\) of the Directory whose files\' extensions need to be modifed to .new: “
read dirName
done

#The function (for changing the file extension to .new in the user specified directory) call
changeFileExtension $dirName
