source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle autojump
antigen bundle zsh-kubectl-prompt

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jonmosco/kube-ps1

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Custom export
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/bin

# Enable iex history
export ERL_AFLAGS="-kernel shell_history enabled"


# Bindkeys for autosuggest plugin
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute

# Autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# ASDF setup
source ~/.asdf/asdf.sh

JAVA_HOME_ASDF="~/.asdf/plugins/java/set-java-home.zsh"
[ -f $JAVA_HOME_ASDF ] &&  source $JAVA_HOME_ASDF

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Load local configuration
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Load other sources
[ -f ~/zsh/k8s.zsh ] && source ~/zsh/k8s.zsh
[ -f ~/zsh/docker.zsh ] && source ~/zsh/docker.zsh
[ -f ~/zsh/fzf.zsh ] && source ~/zsh/fzf.zsh
[ -f ~/zsh/git.zsh ] && source ~/zsh/git.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
