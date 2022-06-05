export PATH=$PATH:/opt/fzf/bin

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/.fzf/bin ] && export PATH=$PATH:$HOME/.fzf/bin
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

