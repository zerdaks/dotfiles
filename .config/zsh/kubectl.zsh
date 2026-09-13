# Kubernetes aliases
#
# Bodies are single-quoted so the command substitutions run when the alias is
# invoked rather than when it is defined.

# kubens and kubectx open fzf themselves when run without arguments
alias ns=kubens
alias ctx=kubectx

# pick names from `kubectl get <resource>`; extra args (e.g. --multi) go to fzf
__kpick() {
    local res=$1
    shift
    kubectl get "$res" |
        fzf --header-lines=1 --bind "ctrl-r:reload(kubectl get $res)" "$@" |
        awk '{print $1}'
}

alias ctlpods='kubectl exec -it $(__kpick pods) -- /bin/sh'
alias ctljobs='kubectl exec -it job/$(__kpick jobs) -- /bin/sh'
alias ctllogs='kubectl logs $(__kpick pods)'
alias ctlevents='kubectl get events --field-selector involvedObject.name=$(__kpick pods)'
alias ctldescribe='kubectl describe pod $(__kpick pods --multi)'
alias ctldelpods='kubectl delete pod $(__kpick pods --multi)'
alias ctldeljobs='kubectl delete job $(__kpick jobs --multi)'

# a function rather than an alias so the jq program can be single-quoted
ctlsecrets() {
    kubectl get secret "$(__kpick secrets)" -o json |
        jq -r '.data | to_entries[] | "\(.key): \(.value | @base64d)"'
}
