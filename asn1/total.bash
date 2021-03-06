#!/bin/bash

# Function to read an object from a file
read_item(){
    read item_name simp_name
    read unit_price curr_q max_q
    read item_desc
}

# get item number from user
read -p "Item number: " item_num
# check if item exists
file_path=./data/$item_num.item

# check if the file exists
if ! [[ -f $file_path ]]
then
    #exit if item does not exist
    echo "ERROR: item $item_num not found"
    exit 1
# otherwise, print the required information
else

#read from file
read_item < $file_path

# Echo the final output for the user
echo $item_num - $simp_name - \$$(echo "$unit_price * $curr_q" | bc -l) total
fi