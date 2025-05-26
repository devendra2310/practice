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
if [ $? -ne 0 ]
then
    echo "mysql is not installed...going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo " mysql installed "
        exit 1
    else 
        echo " mysql not installed "
    fi
else 
   echo "mysql is already installed" 
fi