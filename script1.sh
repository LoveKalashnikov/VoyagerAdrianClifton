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

if [ TOTAL_MEMORY ]

echo $USED_MEMORY
echo $TOTAL_MEMORY
echo jejemon