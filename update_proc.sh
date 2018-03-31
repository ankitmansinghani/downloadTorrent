#!/bin/bash

var_1=a$1
var_2=$1
var_3=u$1

python ./update_try.py $var_2

comm -2 -3 $var_3.txt $var_2.txt > diff.txt

if [ -s diff.txt ]

then

mysql -D newuserdata -u projectuser -pankitldrpceb -e "LOAD DATA LOCAL INFILE '/home/villain/final_project/diff.txt' INTO TABLE $var_1 COLUMNS TERMINATED BY '\t'"

mysql -D newuserdata -u projectuser -pankitldrpceb -e "SELECT Magnet_link FROM $var_1 ORDER BY Name ASC LIMIT 1" >> magnetlist.txt

transmission-gtk $(cat magnetlist.txt)

rm magnetlist.txt

rm $var_3.txt $var_2.txt

rm $var_3.txt 

else 
echo -n "\n\nNO NEW EPISOD AVAILABLE\n\n"

fi
