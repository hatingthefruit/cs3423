#!/bin/bash

sedfile=commands.sed

#Check for proper usage of command
if [[ $# -lt 1 ]]; then
    echo "Invalid number of arguments"
    echo
    echo "  usage: assign2.bash inputfile"
    echo
    echo "  Where input file is a c file to be formatted"
    echo
    exit 1
fi

#check that the input file actually exists
if ! [[ -f $1 ]]; then
    echo "ERROR: Input file $1 does not exist. Exiting..."
    exit 1
fi

#Generate a filename to use as a cache
#Follows the format .{inputfile}_fmt.{ext}
outfile=$(echo "$1" | sed -E -f outfile_fmt.sed)

#s/(\w+)\.(\w+)$/.\1_fmt.\2/    :   Inserts a _fmt before the period in a filename
#t                              :   Skips to the end of the file if a substitution was made
#s/(\w+)$/.\1_fmt/              :   Appends an _fmt at the end of the filename if there is no extension

#write the input file to the output to avoid overwriting the input
cat "$1" >"$outfile"

#edit in place using the sedfile defined at the beginning of the script
sed -i.bak -E -f "$sedfile" "$outfile"

#write the output file to stdout
cat "$outfile"

#remove the temporary files created
rm "$outfile" "$outfile.bak"
