#!/bin/bash

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"
LOGS_FOLDER="/var/log/shellscript_logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")
mkdir -p $LOGS_FOLDER

echo "Script started at $(date)"

if [ $userid -ne 0 ]
then 
    echo -e "$r error : please run this script with root access $n" 
    exit 1
else
    echo -e " you're running this script with root access" 
fi

VALIDATE(){
if [ $1 -eq 0 ]
then 
    echo -e " installng $2 is ......$g SUCCESS $n "
else 
    echo -e "Installing $2 is ......$r failed $n " 
    exit 1
fi    
}

for package in ${PACKAGES[@]}
do 
    dnf list installed $package 
    if [ $? -ne 0 ]
    then 
        echo " $package is not installed.....instaling it " 
        dnf install $package -y &>> $LOG_FILE  
        VALIDATE $? "package"
    else
        echo -e "nothing to do $package is $y already installed $n " 
    fi 
done



