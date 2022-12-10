#! /bin/bash

chmod +x research_system.sh
./research_system.sh

echo " "

read -p "Do you want to write the output to a log file? (Y/N)" log

if [[ $log == Y || $log == y ]]; then
	name="$(date +"%d_%m_%y_%H_%M_%s").status"
	./research_system.sh > $name
fi
