function fish_user_key_bindings
    fish_vi_key_bindings

    if type -q fzf_key_bindings
        fzf_key_bindings
    end

    bind -M insert \cf forward-char
    bind -M insert \cA beginning-of-line
    bind -M insert \cE end-of-line
end
