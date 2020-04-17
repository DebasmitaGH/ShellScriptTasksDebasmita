#!/bin/bash

#Author – Debasmita DasGupta
#Version – 1.0
#Descritpion –
#1) This shell script will copy all files from source to destination folder after taking back up of the files
#2) Then it will restart the “httpd” service.

# This function is responsible for copying all files from source to destination folder.
function copyAllFiles()
{
if [ ! -d $2 ]; then
mkdir $2
fi
cp -r $1/* $2
ERROR_CODE=$(echo $?)
ERROR_MSG=$(echo $?)
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue while copying the files. The Error Code is: $ERROR_CODE. The Error Message is: $ERROR_MSG”
#exit 1
else
echo -e “The files have been successfully copied.”
fi
}

#This function is responsible for starting / stopping / restarting the service provided by the user.
function serviceAction()
{
case $2 in
'start')
echo -e “Starting $serviceName service”
systemctl start $1
;;
'stop')
echo -e “Stoping $serviceName service”
systemctl stop $1
;;
'restart')
echo -e “ReStarting $serviceName service”
systemctl restart $1
;;
esac
}

#This function will create the back up of the files.
function createFileBackUp()
{
if [ ! -d $1/BackUpDir ]; then
mkdir $1/BackUpDir
fi
cp  $1/* $1/BackUpDir
ERROR_CODE=$(echo $?)
ERROR_MSG=$(echo $?)
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue in creating a backup of the files. The Error Code is: $ERROR_CODE. The Error Message is: $ERROR_MSG”
#exit 1
else
echo -e “The back up of the files have been successfully created”
fi
}

#This snippet is responsible for taking the user input.
while [[ -z $sourceDirName  ||  -z $destDirName || -z $serviceName || -z $actionReq ]]
do
echo -e “Please enter the Source Directory \"Absolute Path\": “
read sourceDirName
echo -e “Please enter the Destination Directory \"Absolute Path\": “
read destDirName
echo -e “Please enter the Service Name: “
read serviceName
echo -e “Please enter if you want to start / stop / restart the $serviceName service: “
read actionReq
done

#The function (for creating backup of files to be copied to a user provided Destination folder) call
createFileBackUp $sourceDirName

#The function (for copying files from user provided Source folder to Destination folder) call
copyAllFiles $sourceDirName $destDirName

#The function (for performing the user provided action on the user provided Service) call
serviceAction $serviceName $actionReq

