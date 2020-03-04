#!/bin/bash

# Get the item number from the user
read -p "Enter an item number: " item_num

# Function to read an object from a file
read_item(){
    read item_name simp_name
    read unit_price curr_q max_q
    read item_desc
}

# Save the path to the item to avoid retyping it
item_path=./data/$item_num.item

# Check if the given file exists
if ! [[ -f $item_path ]]
then
    echo "ERROR: item $item_num not found"
    exit 1
else 
    # If the file does exist, read the information from the file
    read_item < $item_path
fi

# Print the item data
printf "Item Number:\t$item_num\n"
printf "Item Name:\t$item_name\n"
printf "Simple Name:\t$simp_name\n"
printf "Unit Price:\t$unit_price\n"
printf "Quantity:\t$curr_q / $max_q\n"
printf "Description:\t$item_desc\n"