function ,gbd -d "Delete all branches merged in current HEAD, including squashed"
  # Taken from https://github.com/jhillyerd/plugin-git
  git branch --merged | \
    command grep -vE  '^\*|^\s*(master|main|develop)\s*$' | \
    command xargs -r -n 1 git branch -d

  set -l default_branch develop
  git for-each-ref refs/heads/ "--format=%(refname:short)" | \
    while read branch
      set -l merge_base (git merge-base $default_branch $branch)
      if string match -q -- '-*' (git cherry $default_branch (git commit-tree (git rev-parse $branch\^{tree}) -p $merge_base -m _))
        git branch -D $branch
      end
    end
end
