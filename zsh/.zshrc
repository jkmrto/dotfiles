source /opt/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Custom export
export PATH=$PATH:/usr/local/go/bin
export PATH=/home/jkmrto/.cargo/bin:$PATH
export PATH=/home/jkmrto/.local/bin:$PATH
export PATH=$PATH:/opt/fzf/bin

# ASDF initialization
# https://asdf-vm.com/#/core-manage-asdf-vm
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Enabling ZFZ for CTRL+R lookup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
