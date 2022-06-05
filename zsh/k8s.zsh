# Kubernetes prompt
PROMPT='$(kube_ps1)'$PROMPT
kubeoff

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
    local POD=$(kubectl get pods | fzf | awk '{print $1}')
    local JSON='{range .spec.containers[*]}{.name}{"\t"}{.image}{"\n"}{end}'
    local CONTAINER=$(kubectl get pod/$POD -o jsonpath=$JSON | fzf | awk '{print $1}')
    kubectl logs $POD -c $CONTAINER $1
}
