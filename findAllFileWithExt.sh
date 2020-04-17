#!/bin/bash

#Author – Debasmita DasGupta
#Version – 1.0
#Descritpion – This shell script will find all the files in the provided directory with the provided extension

#This function is responsible for finding all the files in the provided directory with the provided extension.
function findAllFileWithExt()
{
find $1 -name *.$2
ERROR_CODE=$(echo $?)
ERROR_MSG=$(echo $?)
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue in finding files with extension $fileExtension under the directory $dirName.\nThe Error Code is:  $ERROR_CODE.\nThe Error Message is: $ERROR_MSG”
exit 1
else
echo -e “The list has been created successfully.”
fi
}

#This snippet is responsible for taking the user input.
while [[ -z $dirName  ||  -z $fileExtension ]]
do
echo -e “Please enter the \"Absolute Directory Path\" where you want to search the files: “
read dirName
echo -e “Please enter the file extension: “
read fileExtension
done

#The function (for finding all files with user provided extension in user provided directory) call
findAllFileWithExt $dirName $fileExtension
