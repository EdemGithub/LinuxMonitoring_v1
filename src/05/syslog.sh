#! /bin/bash

top5Folders="$(du -h $param | sort -hr | head -5 | awk '{print $2}')"
top5FoldersSize="$(du -h $param | sort -hr | head -5 | awk '{print $1}')"
top5=($top5Folders)
top5f=($top5FoldersSize)

top10Files="$(find $param -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"
top10FilesSize="$(find $param -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')"
top10FilesType="$(find $param -type f -exec du -h {} + | sort -hr | head -10 | awk -F. '{print $3}')"
top10f=($top10Files)
top10s=($top10FilesSize)
top10t=($top10FilesType)


top10EF="$(find $param -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"
top10EFS="$(find $param -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')"
top10exe=($top10EF)
top10exes=($top10EFS)

echo "Total number of folders = $(ls -l $param | grep -c ^d)"
echo "TOP 5 folders of maximum size arranged in descending order:"

for (( i = 0; i < 5; i++ )); do
	printf "%d - " "$((i + 1))"
	printf "${top5[$i]}, "
	echo "${top5f[$i]}"
done

echo "Total number of files = $(ls -laR $param | grep "^-" | wc | awk '{print $1}')"
echo "Number of:"
echo "Configuration Files = $(find $param -type f -name "*.conf" | wc -l)"
echo "Text files = $(find $param -type f -name "*.txt" | wc -l)"
echo "Executable files = $(find $param -type f -name -executable | wc -l)"
echo "Log files = $(find $param -type f -name "*.log" | wc -l)"
echo "Archive files = $(find $param -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)"
echo "Symbolic links = $(find $param -type l | wc -l)"

echo "Top 10 Files of maximum size arranged in descending order:"

for (( i = 0; i < 10; i++ )); do
	printf "%d - " "$((i + 1))"
	printf "${top10f[$i]}, "
	printf "${top10s[$i]}, "
	echo "${top10t[$i]}"
done

echo "TOP 10 executable files of the maximum size arranged in descending order:"

for (( i = 0; i < 10; i++ )); do
	printf "%d - " "$((i + 1))"
	printf "${top10exe[$i]}, "
        printf "${top10exes[$i]}, "
	echo "$(md5sum ${top10exe[$i]} | awk '{print $1}')"
done

END=$(date +%s%N)
DIFF=$((( $END - $START )/1000000 ))
echo "Script execution time = $DIFF ms."
