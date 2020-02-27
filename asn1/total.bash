#!/bin/bash

read_item(){
    read item_name simp_name
    read unit_price curr_q max_q
    read item_desc
}

#get item number from user
read -p "Item number: " item_num
#check if item exists
file_path=./data/$item_num.item

#check if the file exists
if ! [[ -f $file_path ]]
then
    #exit if item does not exist
    echo "ERROR: item $item_num not found"
    exit 1
else

#read from file
read_item < $file_path

echo $item_num - $simp_name - \$$(echo "$unit_price * $curr_q" | bc -l) total

fi