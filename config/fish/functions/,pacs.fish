function ,pacs
    set packages (pacman -Ssq | fzf --query=$argv -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview | string split \n)

    if test -n "$packages"
        sudo pacman -Syy $packages
    end
end

