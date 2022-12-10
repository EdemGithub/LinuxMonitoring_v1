#! /bin/bash

white1="\033[107m"
red1="\033[41m"
green1="\033[42m"
blue1="\033[44m"
purple1="\033[45m"
black1="\033[40m"

white2="\033[97m"
red2="\033[31m"
green2="\033[32m"
blue2="\033[34m"
purple2="\033[35m"
black2="\033[30m"

ret="\e[0m"

mass[0]=$param1
mass[1]=$param2
mass[2]=$param3
mass[3]=$param4

defcolorB1=6
defcolorF1=1
defcolorB2=2
defcolorF2=4

if [[ -z ${mass[0]} ]]; then
	mass[0]=$defcolorB1
	param[0]=1
fi

if [[ -z ${mass[1]} ]]; then
        mass[1]=$defcolorF1
        param[1]=1
fi

if [[ -z ${mass[2]} ]]; then
        mass[2]=$defcolorB2
        param[2]=1
fi

if [[ -z ${mass[3]} ]]; then
        mass[3]=$defcolorF2
        param[3]=1
fi

for i in 0 2; do
	if [[ ${mass[$i]} == 1 ]]; then
		arr[$i]=$white1
		if [[ $i == 0 ]]; then
			colB1="(white)"
		else
			colB2="(white)"
		fi
	elif [[ ${mass[$i]} == 2 ]]; then
		arr[$i]=$red1
                if [[ $i == 0 ]]; then
 	               colB1="(red)"
                else
                       colB2="(red)"
		fi
	elif [[ ${mass[$i]} == 3 ]]; then
		arr[$i]=$green1
		if [[ $i == 0 ]]; then
                       colB1="(green)"
                else
                       colB2="(green)"
                fi
	elif [[ ${mass[$i]} == 4 ]]; then
		arr[$i]=$blue1
		if [[ $i == 0 ]]; then
                       colB1="(blue)"
                else
                       colB2="(blue)"
                fi
	elif [[ ${mass[$i]} == 5 ]]; then
		arr[$i]=$purple1
		if [[ $i == 0 ]]; then
                       colB1="(purple)"
                else
                       colB2="(purple)"
                fi
	elif [[ ${mass[$i]} == 6 ]]; then
		arr[$i]=$black1
		if [[ $i == 0 ]]; then
                       colB1="(black)"
                else
                       colB2="(black)"
                fi
	fi
done

for i in 1 3; do
        if [[ ${mass[$i]} == 1 ]]; then
                arr[$i]=$white2
		if [[ $i == 1 ]]; then
                       colF1="(white)"
                else
                       colF2="(white)"
                fi
        elif [[ ${mass[$i]} == 2 ]]; then
                arr[$i]=$red2
                if [[ $i == 1 ]]; then
                       colF1="(red)"
                else
                       colF2="(red)"
                fi
        elif [[ ${mass[$i]} == 3 ]]; then
                arr[$i]=$green2
                if [[ $i == 1 ]]; then
                       colF1="(green)"
                else
                       colF2="(green)"
                fi
        elif [[ ${mass[$i]} == 4 ]]; then
                arr[$i]=$blue2
                if [[ $i == 1 ]]; then
                       colF1="(blue)"
                else
                       colF2="(blue)"
                fi
        elif [[ ${mass[$i]} == 5 ]]; then
                arr[$i]=$purple2
                if [[ $i == 1 ]]; then
                       colF1="(purple)"
                else
                       colF2="(purple)"
                fi
        elif [[ ${mass[$i]} == 6 ]]; then
                arr[$i]=$black2
                if [[ $i == 1 ]]; then
                       colF1="(black)"
                else
                       colF2="(black)"
                fi
        fi
done

if [[ ${mass[0]} == ${mass[1]} ]]; then
	echo "Background and text color must not match, return the script, bro.."
	exit 1
elif [[ ${mass[2]} == ${mass[3]} ]]; then
	echo "Background and text color must not match, return the script, bro.."
        exit 1
fi

echo -e "${arr[0]}${arr[1]}HOSTNAME$ret = ${arr[2]}${arr[3]}$HOSTNAME$ret"
echo -e "${arr[0]}${arr[1]}TIMEZONE$ret = ${arr[2]}${arr[3]}$(cat /etc/timezone) UTC $(date +"%Z")$ret"
echo -e "${arr[0]}${arr[1]}USER$ret = ${arr[2]}${arr[3]}$USER$ret"
echo -e "${arr[0]}${arr[1]}OS$ret = ${arr[2]}${arr[3]}$(cat /etc/issue | awk '{print $1 " " $2 " " $3}')$ret"

if [[ ${param[0]} == 1 ]]; then
	echo "Column 1 background = default (black)"
else
	echo "Column 1 background = ${mass[0]} $colB1"
fi

if [[ ${param[1]} == 1 ]]; then
        echo "Column 1 font color = default (white)"
else
        echo "Column 1 font color = ${mass[1]} $colF1"
fi

if [[ ${param[2]} == 1 ]]; then
        echo "Column 2 background = default (red)"
else
        echo "Column 2 background = ${mass[2]} $colB2"
fi

if [[ ${param[3]} == 1 ]]; then
        echo "Column 2 font color = default (blue)"
else
        echo "Column 2 font color = ${mass[3]} $colF2"
fi

echo -e "${arr[0]}${arr[1]}DATE$ret = ${arr[2]}${arr[3]}$(date +"%d %B %Y %T")$ret"
echo -e "${arr[0]}${arr[1]}UPTIME$ret = ${arr[2]}${arr[3]}$(uptime -p | awk '{print $2 " hour"}')$ret"
echo -e "${arr[0]}${arr[1]}UPTIME_SEC$ret = ${arr[2]}${arr[3]}$(cat /proc/uptime | awk '{print (( $1 * 1000 / 1000 )) " sec"}')$ret"
echo -e "${arr[0]}${arr[1]}IP$ret = ${arr[2]}${arr[3]}$(hostname -I)$ret"
echo -e "${arr[0]}${arr[1]}MASK$ret = ${arr[2]}${arr[3]}$(netstat -rn | awk 'NR==4{print $3}')$ret"
echo -e "${arr[0]}${arr[1]}GATEWAY$ret = ${arr[2]}${arr[3]}$(ip r | awk '/default via / {print $3}')$ret"
echo -e "${arr[0]}${arr[1]}RAM_TOTAL$ret = ${arr[2]}${arr[3]}$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')$ret"
echo -e "${arr[0]}${arr[1]}RAM_USED$ret = ${arr[2]}${arr[3]}$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')$ret"
echo -e "${arr[0]}${arr[1]}RAM_FREE$ret = ${arr[2]}${arr[3]}$(free -m | awk '/Mem/{printf "%.3f GB", $4/1024}')$ret"
echo -e "${arr[0]}${arr[1]}SPACE_ROOT$ret = ${arr[2]}${arr[3]}$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')$ret"
echo -e "${arr[0]}${arr[1]}SPACE_ROOT_USED$ret = ${arr[2]}${arr[3]}$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')$ret"
echo -e "${arr[0]}${arr[1]}SPACE_ROOT_FREE$ret = ${arr[2]}${arr[3]}$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')$ret"
