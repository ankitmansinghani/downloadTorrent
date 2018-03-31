#!/bin/bash

var_1=a$1

mysql -D newuserdata -u projectuser -pankitldrpceb -e "SELECT DISTINCT name FROM $var_1"
