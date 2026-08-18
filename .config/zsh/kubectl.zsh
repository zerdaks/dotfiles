# Kubernetes aliases
#
# Bodies are single-quoted so the command substitutions run when the alias is
# invoked rather than when it is defined.
alias ns='kubens | fzf | xargs -I {} kubens {}'
alias ctx='kubectx | fzf | xargs -I {} kubectx {}'
alias ctldeljobs='kubectl delete job $(__fzf_jobs)'
alias ctldelpods='kubectl delete pod $(__fzf_pods)'
alias ctldeployments='kubectl get deployments'
alias ctldescribe='kubectl describe pod $(__fzf_pods)'
alias ctllogs=__ctl_logs
alias ctlevents='kubectl get events --field-selector involvedObject.name=$(__fzf_pod)'
alias ctlnamespace='kubectl config view --minify -o jsonpath="{.contexts[0].context.namespace}"'
alias ctljobs='kubectl exec -it job/$(__fzf_jobs) -- /bin/sh'
alias ctlpods='kubectl exec -it $(__fzf_pods) -- /bin/sh'
alias ctlsecrets=__ctl_secrets

# Kubernetes functions

__ctl_logs() {
    local pod
    pod=$(__fzf_pod)
    kubectl logs "$pod" >>"$pod.log"
}

# a function rather than an alias so the jq program can be single-quoted
__ctl_secrets() {
    kubectl get secret $(__fzf_secrets) -o json |
        jq -r '.data | to_entries[] | "\(.key): \(.value | @base64d)"'
}

# single-select: used by __ctl_logs and ctlevents
__fzf_pod() {
    kubectl get pods | fzf --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
}

# multi-select: used by ctldeljobs, ctljobs
__fzf_jobs() {
    kubectl get jobs | fzf --multi --bind 'ctrl-r:reload(kubectl get jobs)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
}

# multi-select: used by ctldelpods, ctldescribe, ctlpods
__fzf_pods() {
    kubectl get pods | fzf --multi --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
}

__fzf_secrets() {
    kubectl get secrets | fzf --header "Select a secret to view" | awk '{print $1}'
}
