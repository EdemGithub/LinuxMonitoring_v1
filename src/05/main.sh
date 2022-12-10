#! /bin/bash

export START=$(date +%s%N)

if [ $# != 1 ]; then
	echo "Paramaters should not be, bro.."
	exit 1
fi

	export param=$1
	chmod +x syslog.sh
	./syslog.sh
