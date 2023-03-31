#Convenience aliases
alias k=kubectl

function k8sresources () {
    kubectl api-resources --verbs=list --namespaced -o name \
        | xargs -P8 -n 1 kubectl get --show-kind --ignore-not-found -n $1
}

