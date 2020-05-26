if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end


function fish_user_key_bindings
  bind \cr reverse_history_search
end


# bobthefish prompt configuration
set -g theme_display_date no
set -g theme_color_scheme solarized

status --is-interactive; and source (pyenv init -|psub)

