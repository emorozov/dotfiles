set sensible_search "(bfs -exclude -name .git -exclude -name .cache -exclude -name .local -exclude -name .zoom -exclude -name __pycache__ | fzf)"

abbr --add --position command gs git status -sb
abbr --add --position command gco git checkout
abbr --add --position command ga git add
abbr --add --position command gc git commit
abbr --add --position command gp git push
abbr --add --position command gsl git stash list
abbr --add --position command gsp git stash show "'stash@{0}'"
abbr --add --position command --set-cursor gsi git stash push -m "'%'"
abbr --add --position command gso git stash pop
abbr --add --position command de docker exec -it
abbr --add --position command n nvim
abbr -a g grep
abbr -a --position command x xz -9ev -T0
abbr -a --position command u xzcat -v
abbr -a --position command e "nvim $sensible_search"
abbr -a --position command f "nvim (rg -n --color=never . | fzf | awk -F: '{ print \$1, \"+\"\$2 }' | string split ' ')"
abbr -a --position anywhere --set-cursor le "%| less"
abbr -a --position anywhere te "&| tee"

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

abbr -a '***' --position anywhere $sensible_search

