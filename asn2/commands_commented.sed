/\/\*.*\*\//!{ #skip single line comments of the form /**/
    /\/\*/,/\*\//!{ #skip multiline comments
        /(^\s*#|^\s*\/\/)/!{ #skip lines that are preprocessor directives or single line comments
            s/(\w+)[ ]+/\1 /g #replaces any word followed by one or more spaces with exactly one space
            s/(\w)\s*([=&|]{2}|[!<>]=|\/|[%+*=<>^-])\s*(\w)/\1 \2 \3/g #Takes care of surrounding binary operators with exactly one space on either side
            s/(\S)\s{2,}$/\1/ #Strips extra trailing whitespace from the end of the line
            s/(\w+)\s+\(/\1\(/g #Removes spaces before open parenthesis
            s/\(\s+(\S+)/\(\1/g #Removes spaces after opent parenthesis
            s/(\S+)\s+\)/\1\)/g #Removes spaces before closing parenthesis
            s/(\S+)\{/\1 \{/g # Formats open brackets that are not at the beginning of the line
        }
    }
}