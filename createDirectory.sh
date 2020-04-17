#!/bin/bash

#Author – Debasmita DasGupta
#Version – 1.0
#Descritpion – This shell script will ask the user a directory name and create the same under the folder /tmp

#This function is responsible for creating the user provided Directory under the /tmp folder and prompt the user about the success or failure of the Directory creation.
function createDirectory()
{
mkdir /../tmp/$1
ERROR_CODE=$(echo $?)
ERROR_MSG=$(echo $?)
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue in creating the provided Directory \"$1\" under /tmp folder. The Error Code is: $ERROR_CODE. The Error Message is: $ERROR_MSG”
exit 1
else
echo -e “The Directory \"$1\" has been succesfully created under /tmp folder”
fi
}

#This snippet is responsible for taking the user input.
while [ -z $dirName ]
do
echo “Please enter just the Directory name that you want to be created under /tmp folder: “
read dirName
done

#The function (for creating the directory) call
createDirectory $dirName
