/\/\*.*\*\//!{
    /\/\*/,/\*\//!{
        /(^\s*#|^\s*\/\/)/!{
            s/(\w+)[ ]+/\1 /g
            s/(\w)\s*([=&|]{2}|[!<>]=|\/|[%+*=<>^-])\s*(\w)/\1 \2 \3/g
            s/(\S)\s{2,}$/\1/
            s/(\w+)\s+\(/\1\(/g
            s/\(\s+(\S+)/\(\1/g
            s/(\S+)\s+\)/\1\)/g
            s/(\S+)\{/\1 \{/g
        }
    }
}