#!/bin/bash


echo "all variables passed to this sscript : $@ "
echo "number of variables passed : $#"
echo "script name : $0 "
echo "current directory : $PWD "
echo "home directory of the user running the script : $HOME "
echo : "process ID of the script : $$ "
sleep 45 &
echo "Process ID of the last command in background : $! "