# Kubernetes aliases
alias ns 'kubens | fzf | xargs -I {} kubens {}'
alias ctx 'kubectx | fzf | xargs -I {} kubectx {}'
alias ctldeljobs 'kubectl delete job (__fzf_jobs)'
alias ctldelpods 'kubectl delete pod (__fzf_pods)'
alias ctldeployments 'kubectl get deployments'
alias ctldescribe 'kubectl describe pod (__fzf_pods)'
alias ctllogs __ctl_logs
alias ctlevents 'kubectl get events --field-selector involvedObject.name=(__fzf_pod)'
alias ctlnamespace 'kubectl config view --minify -o jsonpath="{.contexts[0].context.namespace}"'
alias ctljobs 'kubectl exec -it (__fzf_jobs) -- /bin/sh'
alias ctlpods 'kubectl exec -it (__fzf_pods) -- /bin/sh'
alias ctlsecrets 'kubectl get secret (__fzf_secrets) -o json | jq -r ".data | to_entries[] | \"\(.key): \(.value | @base64d)\""'

# Kubernetes functions

function __ctl_logs
    set pod (__fzf_pod)
    kubectl logs $pod >>"$pod.log"
end

# single-select: used by __ctl_logs and ctlevents
function __fzf_pod
    kubectl get pods | fzf --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

# multi-select: used by ctldeljobs, ctljobs
function __fzf_jobs
    kubectl get jobs | fzf --multi --bind 'ctrl-r:reload(kubectl get jobs)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

# multi-select: used by ctldelpods, ctldescribe, ctlpods
function __fzf_pods
    kubectl get pods | fzf --multi --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

function __fzf_secrets
    kubectl get secrets | fzf --header "Select a secret to view" | awk '{print $1}'
end
