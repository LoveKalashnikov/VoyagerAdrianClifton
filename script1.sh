 #!/bin/bash
TOTAL_MEMORY=$( free | grep Mem: | awk '{print $2 }' )
USED_MEMORY=$( free | grep Mem: | awk '{print $3 }' )
TOP_PROCESSES=$( ps aux | sort -nk +4 | tail | awk '{print $11}')
subject=$(date +'%Y%m%d %H:%M memory check -critical')
while getopts c:w:e: j; do
  if [ $j = "c" ]; then
  	c=$OPTARG
  elif [ $j = "w" ]; then
  	w=$OPTARG
  elif [ $j = "e" ]; then
  	e=$OPTARG
  fi
done

if [ "$c" = "" ]; then 
	echo "put value for critical threshold (c)"
	exit
fi
if [ "$w" = "" ]; then
	echo "put value for warning threshold (w)"
	exit
fi
if  [ "$e" = "" ]; then
	echo "put value for email (e)"
	exit
fi
criticalMem=$((( $TOTAL_MEMORY / 100 ) * $c ))
warningMem=$((( $TOTAL_MEMORY / 100 ) * $w ))

if [ "$w" -gt 100 ]; then
	echo "w must be less than 100"
	exit
fi

if [ "$c" -gt 100 ]; then
	echo "c must be less than 100"

	exit
fi

if [ "$w" -gt "$c" ]; then
	echo "w must be less than c"
	exit
fi

if [ "$USED_MEMORY" -ge "$criticalMem" ]; then
	echo 2
	echo $TOP_PROCESSES | mail -s "$subject" $e
	exit 2
elif [ "$USED_MEMORY" -ge "$warningMem" ]; then
	echo 1
	exit 1
else
	echo 0
	exit 0
fi

