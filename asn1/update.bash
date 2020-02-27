#!/bin/bash

#get the item number and make sure it is a 4-digit integer
read -p "Item number: " item_num


#get the item name, and make sure there is no whitespace in it
read -p "Item name: " item_name toss
read -p "Simple name: " simp_name

#get the unit price and check that it is a valid floating point number
read -p "Unit price: " price

#Sanitize the price.
#This makes sure the price ends with a .0 if no decimal places have been entered
if [[ $price == +([0-9]) ]]
then
    price=$price.0
elif [[ $price == +([0-9]). ]]
then
    price=${price}0
fi

#get current quantity and make sure it is an unsigned int
read -p "Current quantity: " curr_q


#get max quantity and make sure it is an unsigned int
read -p "Max quantity: " max_q
read -p "Description: " desc

#check if the file exists, exit if it doesn't
if ! [[ -f ./data/$item_num.item ]]
then
    echo "ERROR: item $item_num not found"
    exit 1
fi

#If we're at this point in the script, assume that the file does exist

#Read the input in the file

#For each variable, check that it is not an empty value
#if it is, then update it with the value from the file

#Now that all the values are updated correctly, overwrite the file with all the proper information

#update the log file

