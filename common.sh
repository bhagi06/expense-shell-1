#!/bin/bash


USERID=$(id -u)

#Timmestamp and logs
Timmestamp=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\6[0m"
echo "Please enter db password  :"
read -s mysql_root_password
#root access
VALIDATE(){
    if [$1 -ne 0 ]
    then 
    echo -e "$2....$R FAILURE $N"
    exit 1
    else
    echo -e "$2-----$G sucess $N"
    fi
}

check_root(){
   if [ $USERID -ne 0 ]
then
echo " Please run this script with root access."
exit 1 #manually exit if error comes
else
 echo "You are super user."
 fi 
}
 