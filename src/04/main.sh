#! /bin/bash

if [ $# != 0 ]; then
	echo "Paramaters should not be, bro.."
else
	source config.txt
	export param1=$column1_background
	export param2=$column1_font_color
	export param3=$column2_background
	export param4=$column2_font_color

	chmod +x syslog.sh
	./syslog.sh
fi


