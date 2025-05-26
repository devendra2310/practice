#/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then 
    echo "please run this script with root access"
    exit 1 
else 
    echo "you're running with root access"
fi
dnf list installed mysql
if [ $? -eq 0 ]
then
    echo "mysql is already installed'
    exit 1
else 
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo " mysql installed "
    else 
        echo " mysql not installed "
        exit 1
    fi
fi

