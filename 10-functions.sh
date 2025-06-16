#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "error: please run this script with root access"
    exit 1
else 
    echo " you are running with root access"
fi

# validate function takes input as exit status

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "istalling $2 is ........SuCCESS"
    else 
        echo "installing $2 is ......FAILED"
        exit 1
    fi
}

dnf list install mysql
if [ $? -ne 0 ]
then 
    echo "MySQL is not installed....going to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
    echo "MySQL is already installed"
fi

dnf list install python3
if [ $? -ne 0 ]
then 
    echo "python3 is not installed....going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo "python3 is already installed"
fi


dnf list install nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed....going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo "nginx is already installed"
fi


