#!/bin/bash
ARRAY=("$@")
ELEMENTS=${#ARRAY[@]}

echo "Number of arguments:" $ELEMENTS

for (( i = $ELEMENTS; i >= 0; i-- )); do
echo "${ARRAY[${i}]}"
done


