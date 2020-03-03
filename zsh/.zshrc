source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle autojump

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Custom export
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/fzf/bin
export PATH=$PATH:/usr/local/bin

# ASDF initialization
# https://asdf-vm.com/#/core-manage-asdf-vm
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

# Enabling ZFZ for CTRL+R lookup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bindkeys for autosuggest plugin
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute

# Autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Load local configuration
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
