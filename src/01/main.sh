#!/bin/bash 

if [[ $# == 1 && $1 != [0-9] ]]; then
	echo $1
else
	echo "Parametr fail"
fi
