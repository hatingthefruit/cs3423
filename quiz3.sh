#!/bin/bash

count=1

while read line; do
    if [[ $(($count % 3)) -eq 0  ]]
    then
        echo $line 
    fi
    let count+=1
done < $1

if [[ $count -gt 10 ]]
then
    echo "big"
else
    echo "small"
fi
