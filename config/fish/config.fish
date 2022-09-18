if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


# bobthefish prompt configuration
set -g theme_display_date no
set -g theme_color_scheme solarized

# vi mode customization
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

zoxide init fish | source
status --is-interactive; and source /opt/asdf-vm/asdf.fish

# For the CentOS container
if grep -F CentOS-7 /etc/os-release
    set -x TERM xterm-256color
end

