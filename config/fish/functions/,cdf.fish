function ,cdf
    set dir (fd -t d --search-path ~ | fzf --query=$argv --preview="tree -L 1 {}" --bind=space:toggle-preview --preview-window=:hidden)

    if test -n "$dir"
        cd $dir
    end
end

