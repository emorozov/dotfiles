if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

fish_add_path ~/bin
fish_add_path /opt/vkteams

set fish_function_path ~/.config/fish/fish-work/uma/ $fish_function_path

set -x FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
set -x FZF_ALT_C_COMMAND "fd -t d -H --color=never"
set -x FZF_ALT_C_OPTS "--preview 'tree -C {} | head -50'"
set -x FZF_COMPLETE 0

# bobthefish prompt configuration
set -g theme_display_date no
set -g theme_color_scheme solarized

# vi mode customization
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

if status --is-interactive
    source ~/.config/fish/conf.d/abbreviations.fish
    source ~/.config/fish/fish-work/uma/uma-abbrevs.fish

    zoxide init fish | source
    mise activate fish | source
    starship init fish | source
    atuin init fish | source
end

