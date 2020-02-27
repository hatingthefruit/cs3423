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
#otherwise, read the file to get current information
    read_item < $file_path
#delete the file
    rm $file_path
#update the log
    echo "$(date '+%Y-%m-%d %H:%M:%S') DELETED: $item_num - $item_name - $simp_name - $curr_q" >> ./data/queries.log
fi