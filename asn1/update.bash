#!/bin/bash

#get the item number and make sure it is a 4-digit integer
read -p "Item number: " item_num


#get the item name, and make sure there is no whitespace in it
read -p "Item name: " item_name toss
read -p "Simple name: " simp_name

#get the unit price and check that it is a valid floating point number
read -p "Unit price: " unit_price

#Sanitize the price.
#This makes sure the price ends with a .0 if no decimal places have been entered
if [[ $unit_price == +([0-9]) ]]
then
    unit_price=$unit_price.0
elif [[ $unit_price == +([0-9]). ]]
then
    unit_price=${unit_price}0
fi

#get current quantity and make sure it is an unsigned int
read -p "Current quantity: " curr_q


#get max quantity and make sure it is an unsigned int
read -p "Max quantity: " max_q
read -p "Description: " item_desc

file_path=./data/$item_num.item

#check if the file exists, exit if it doesn't
if ! [[ -f $file_path ]]
then
    echo "ERROR: item $item_num not found"
    exit 1
fi

#If we're at this point in the script, assume that the file does exist

#Read the input in the file
read_old_item(){
    read old_item_name old_simp_name
    read old_unit_price old_curr_q old_max_q
    read old_item_desc
}

read_old_item < $file_path


#overwrite the file with all the proper information
#The ${name:-$alternate name} expands the first if it is not empty, or replaces the whole thing with the expansion of the second if it is
#Here the checking of the new strings and writing to the file is done in one step
rm $file_path
echo ${item_name:-$old_item_name} ${simp_name:-$old_simp_name}  >> $file_path
echo ${unit_price:-$old_unit_price} ${curr_q:-$old_curr_q} ${max_q:-$old_max_q} >> $file_path
echo ${item_desc:-$old_item_desc} >> $file_path


#update the log file

