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


# Bindkeys for autosuggest plugin
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute

# Autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

function dlogs {
    local CONTAINER=$(docker ps -a | fzf | awk '{print $1}')
    docker logs $CONTAINER
}

function dremove {
	docker ps -a | fzf -m | awk '{print $1}' | xargs docker rm -f
}

function gck {
    git checkout $(git branch | peco)
}

# ASDF setup
source ~/.asdf/asdf.sh

JAVA_HOME_ASDF="~/.asdf/plugins/java/set-java-home.zsh"
[ -f $JAVA_HOME_ASDF ] &&  source $JAVA_HOME_ASDF

alias gck='git fetch && git checkout -b $(git branch -a | peco | sed "s/remotes\/origin\///")'

# Rust installation
# export PATH=$PATH:$HOME/.cargo/bin

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/.fzf/bin ] && export PATH=$PATH:$HOME/.fzf/bin
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'


function gsina {
  git status --porcelain \
  | awk '{ if (substr($0, 0, 2) ~ /^[ ?].$/) print $0 }' \
  | fzf --height=10 \
  | awk '{ print "'`git rev-parse --show-toplevel`'/"$2 }'
}

alias ga='gsina | xargs git add'

# export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

# Load local configuration
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

### Kubernetes functions

# Remove kubernetes configs. Only keeps minikube one 
alias kubeconfig-clean='cp ~/.kube/config.minikube ~/.kube/config'

alias kubeconfig-get-credentials='gcloud container clusters get-credentials $(gcloud container clusters list |  awk '{ print $1 }' | fzf)'

function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}

function klogs {
    local POD=$(kubectl get pods | peco | awk '{print $1}')
    local JSON='{range .spec.containers[*]}{.name}{"\t"}{.image}{"\n"}{end}'
    local CONTAINER=$(kubectl get pod/$POD -o jsonpath=$JSON | peco | awk '{print $1}')
    kubectl logs $POD -c $CONTAINER $1
}
