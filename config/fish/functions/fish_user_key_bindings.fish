function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end


function fish_user_key_bindings
    fish_vi_key_bindings
    bind \cr reverse_history_search
    bind -M insert \cr reverse_history_search
    bind -M insert \cf forward-char
    bind -M insert \cA beginning-of-line
    bind -M insert \cE end-of-line
end
