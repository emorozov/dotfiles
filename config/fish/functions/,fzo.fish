function ,fzo
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
end

