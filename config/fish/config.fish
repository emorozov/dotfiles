if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

fish_add_path ~/bin
fish_add_path /opt/vkteams

set fish_function_path ~/.config/fish/fish-work/uma/ $fish_function_path


# bobthefish prompt configuration
set -g theme_display_date no
set -g theme_color_scheme solarized

# vi mode customization
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

if type -q fzf_key_bindings
    fzf_key_bindings
end

if status --is-interactive
    source ~/.config/fish/conf.d/abbreviations.fish
    source ~/.config/fish/fish-work/uma/uma-abbrevs.fish

    zoxide init fish | source
    rtx activate fish | source
    starship init fish | source
end

