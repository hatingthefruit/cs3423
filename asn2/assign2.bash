#!/bin/bash

#define list of sed files
command_list=(tokens.sed binary_ops.sed lines.sed conditions.sed braces.sed)

#tokens.sed: Makes sure tokens are separated by exactly one space
#binary_ops.sed: Makes sure operators are surrounded by exactly one space on either side
#lines.sed: Strips trailing whitespace at the end of lines
#conditions.sed: Makes sure there are no spaces before conditions, or immediately inside parenthesis
#braces.sed: Puts one space before any opening brace that is not on it's own line

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

for sedfile in "${command_list[@]}"; do
    sed -i.bak -E -f "$sedfile" "$outfile"
done

cat "$outfile"

rm "$outfile" "$outfile.bak"
