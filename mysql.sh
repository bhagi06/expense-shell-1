#!/bin/bash

#logging,validation,coloring are important for everu script
source ./common.sh
check_root()

 dnf install mysql-server -y &>>$LOGFILE
 VALIDATE $? "Installing Mysql server"

 systemctl enable mysqld &>>$LOGFILE
 VALIDATE $? "Enabling mqsql server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting my sql server"


# mysql_secure_installation --set-root-pass ExpenseApp@1
# VALIDATE $? "setting up root password"
mysql -h mysql.bhagi.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [$? -ne 0]
then
mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
VALIDATE $? "MYSQL ROOT PASSWORD SETUP"
else
echo -e "mysql root password is already setup...$Y SKIPPING $N"

fi