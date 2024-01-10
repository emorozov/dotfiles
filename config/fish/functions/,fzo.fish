function ,fzo
    set file (fd -t f -H | fzf --query=$argv --select-1 --exit-0 --preview="lesspipe.sh {}" | string split \n)

    if test -n "$file"
        xdg-open $file 2>&-; and true # This line is added to prevent failure when using "set -e" in shell.
    end
end

