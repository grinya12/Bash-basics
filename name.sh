#!/bin/bash

name=$name
surname=$surname
echo $name
echo $surname
 
echo -e "Please type your full name: \c "
read name surname
fullname=$name" "$surname
 
echo "your name:" $name
echo "your surname:" $surname
echo "fullname:" $fullname
