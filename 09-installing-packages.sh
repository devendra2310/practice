#/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then 
    echo "please run this script with root access"
    exit1 
else 
    echo "you're running with root access"
fi
dnf install mysql -y

if [ $? -eq 0 ]
then
    echo " mysql installed "
else 
    echo " mysql not installed "
    exit1
fi
