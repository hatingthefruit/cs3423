#!/bin/bash
echo "1. Show list of arguments"
for file in "$@"
do
    echo $file
done

echo "2. Declare everything in the program"
for file in asdf we d vsw ebw
do
    echo $file
done

echo "3. Use a command"
for file in $(date)
do
    echo $file
done
