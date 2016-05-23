 #!/bin/bash
TOTAL_MEMORY=$( free | grep Mem: | awk '{print $2 }' )
USED_MEMORY=$( free | grep Mem: | awk '{print $3 }' )

while getopts c:w:e: j; do
  echo $j
  if [ $j = "c" ]; then
  	c=$OPTARG
  	echo $c
  	echo "got in 1"
  elif [ $j = "w" ]; then
  	w=$OPTARG
  	echo $w
  	echo $c
  	echo "got in 2"
  elif [ $j = "e" ]; then
  	e=$OPTARG
  	echo $e
  	echo "got in 3"
  fi
done
echo $USED_MEMORY

criticalMem=$((( $TOTAL_MEMORY / 100 ) * $c ))
warningMem=$((( $TOTAL_MEMORY / 100 ) * $w ))

echo $criticalMem
echo $warningMem
if [ "$USED_MEMORY" -ge "$criticalMem" ]; then
	echo 'a'
elif [ "$USED_MEMORY" -ge "$warningMem" ]; then
	echo 'b'
else
	echo 'c'
fi

