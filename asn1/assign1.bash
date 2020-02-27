#!/bin/bash

display_menu() {
    echo "Enter one of the following actions or press CTRL-D to exit."
    printf "\tC - create a new inventory item\n"
    printf "\tR - read an existing inventory item\n" 
    printf "\tU - update an existing inventory item\n"
    printf "\tD - delete an existing inventory item\n" 
    printf "\tT - calculate total value of an inventory item\n"
}

display_menu

while read input
do
    case $input in
        [Cc]) ./create.bash;; 
        [Rr]) ./read.bash;;
        [Uu]) ./update.bash;;
        [Dd]) ./delete.bash;;
        [Tt]) ./total.bash;;
        *) echo "ERROR: Invalid option"; continue;;
    esac

    display_menu
done