#!/bin/bash

var_1=a$1
var_2=$2

#python ./magnet.py $var_2

mysql -D newuserdata -u projectuser -pankitldrpceb -e "SELECT Magnet_link FROM $var_1 LIMIT $var_2 , 1" >> magnetlist.txt

transmission-gtk $(cat magnetlist.txt)

rm magnetlist.txt
