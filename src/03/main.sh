#! /bin/bash

if [ $# != 4 ]; then
	echo "Parameters are not correct"
	exit 1
else
	export param1=$1
	export param2=$2
	export param3=$3
	export param4=$4
fi

for i in $param1 $param2 $param3 $param4; do
	if [[ $i < 1 || $i > 6 ]]; then
	echo -e "Parameters are not correct.\nPlease enter numbers from 1 to 6."
	exit 1
	fi
done

if [[ $param1 == $param2 ]]; then
	echo "Background and text color must not match, return the script"
	exit 1
fi

if [[ $param3 == $param4 ]]; then
	echo "Background and text color must not match, return the script"
        exit 1
fi

chmod +x sys_info.sh
./sys_info.sh
