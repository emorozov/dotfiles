# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
function ,fe --description "Open the selected file with the default editor"
    set files (fd -t f -H | fzf --query=$argv --multi --select-1 --exit-0 --preview="bat --color=always {}" | string split \n)

    if test -n "$files"
        nvim $files; and true # This line is added to prevent failure when using "set -e" in shell.
    end
end
