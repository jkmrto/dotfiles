alias gck='git fetch && git checkout -b $(git branch -a | peco | sed "s/remotes\/origin\///")'

function gsina {
  git status --porcelain \
  | awk '{ if (substr($0, 0, 2) ~ /^[ ?].$/) print $0 }' \
  | fzf --height=10 \
  | awk '{ print "'`git rev-parse --show-toplevel`'/"$2 }'
}

alias ga='gsina | xargs git add'
