function ,fze
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" nvim -O
end

