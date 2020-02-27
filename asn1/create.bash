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

#Check if the data directory exists, if it doesn't then make it
if ! [[ -d ./data ]]
then
    mkdir data
fi

#Save the full path to the item file to avoid having to keep typing it
item_path=./data/$item_num.item

#check if there is already an entry for this item number
if [[ -f $item_path && -s $item_path ]]
then
    echo "ERROR: item $item_num already exists"
    exit 1
else
    echo $item_name $simp_name >> $item_path
    echo $price $curr_q $max_q >> $item_path
    echo $desc >> $item_path

    echo "$(date '+%Y-%m-%d %H:%M:%S') CREATED: $item_num - $item_name - $curr_q / $max_q" >> ./data/queries.log
fi
