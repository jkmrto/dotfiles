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

# Kubernetes prompt
PROMPT='$(kube_ps1)'$PROMPT
kubeoff

# Custom export
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/fzf/bin
export PATH=$PATH:/usr/local/bin

# Enable iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# ASDF initialization
# https://asdf-vm.com/#/core-manage-asdf-vm

# Enabling ZFZ for CTRL+R lookup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bindkeys for autosuggest plugin
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute

# Autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

function klogs {
	local POD=$(kubectl get pods | peco | awk '{print $1}')
	local JSON='{range .spec.containers[*]}{.name}{"\t"}{.image}{"\n"}{end}'
	local CONTAINER=$(kubectl get pod/$POD -o jsonpath=$JSON | peco | awk '{print $1}')
	kubectl logs $POD -c $CONTAINER $1
 }

function dlogs {
	local CONTAINER=$(docker ps -a | peco | awk '{print $1}')
	docker logs $CONTAINER
 }

function gck {
	git checkout $(git branch | peco)
}

# Load local configuration
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Java home for asdf
. ~/.asdf/plugins/java/set-java-home.zsh

# Rust installation
export PATH=$PATH:$HOME/.cargo/bin
