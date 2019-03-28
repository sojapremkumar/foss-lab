#! /bin/bash

plus='+'

if [ $1 == $plus ]
then
	result=$(expr $2 + $3)

   	echo "The result is: " $result
else

   echo "Operator not defined"
fi
