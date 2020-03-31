#!/bin/bash

sedfile=commands.sed

#Check for proper usage of command
if [[ $# -lt 1 ]]; then
    echo "Invalid number of arguments"
    echo
    echo "usage: assign2.bash inputfile"
fi

#check that the input file actually exists
if ! [[ -f $1 ]]; then
    echo "ERROR: Input file $1 does not exist. Exiting..."
    exit 1
fi

#Save the input and output files in variables to make life easier
infile=$1
outfile=$(echo "$1" | sed -E -f outfile_fmt.sed)

cat "$infile" >"$outfile"

sed -i.bak -E -f "$sedfile" "$outfile"

cat "$outfile"

rm "$outfile" "$outfile.bak"
