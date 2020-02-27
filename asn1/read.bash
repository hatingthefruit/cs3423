#!/bin/bash

read -p "Enter an item number: " item_num

read_item(){
    read item_name simp_name
    read unit_price curr_q max_q
    read item_desc
}

item_path=./data/$item_num.item

if ! [[ -f $item_path ]]
then
    echo "ERROR: item $item_num not found"
    exit 1
else 
    read_item < $item_path
fi

printf "Item Number:\t$item_num\n"
printf "Item Name:\t$item_name\n"
printf "Simple Name:\t$simp_name\n"
printf "Unit Price:\t$unit_price\n"
printf "Quantity:\t$curr_q / $max_q\n"
printf "Description:\t$item_desc\n"