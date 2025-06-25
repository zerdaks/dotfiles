# custom colors for jq
set -x JQ_COLORS '36;1:35;1:33;1:34;1:38;1:32;1:90;1:97;1:49'

# interactive AWS profile selection
alias awsprofile 'export AWS_PROFILE=$(aws configure list-profiles | fzf)'

# Kubernetes aliases and functions

alias ns 'kubens | fzf | xargs -I {} kubens {}'
alias ctx 'kubectx | fzf | xargs -I {} kubectx {}'

alias ctldelete 'kubectl delete pod $(__fzf_pods)'
alias ctldeployments 'kubectl get deployments'
alias ctldescribe 'kubectl describe pod $(__fzf_pods)'
alias ctllogs '__ctllogs'
alias ctlevents 'kubectl get events --field-selector involvedObject.name=$(__fzf_pods)'
alias ctlnamespace 'kubectl config view --minify -o jsonpath="{.contexts[0].context.namespace}"'
alias ctlpods 'kubectl exec -it $(__fzf_pods) -- /bin/sh'
alias ctlsecrets 'kubectl get secret $(__fzf_secrets) -o json | jq -r ".data | to_entries[] | \"\(.key): \(.value | @base64d)\""'

function __ctllogs
    set pod (__fzf_pod)
    kubectl logs $pod >> "$pod.log"
end

function __fzf_pod
    kubectl get pods | fzf --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

function __fzf_pods
    kubectl get pods | fzf --multi --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

function __fzf_secrets
    kubectl get secrets | fzf --header "Select a secret to view" | awk '{print $1}'
end

# use a secrets file if it exists
set -l secrets (dirname (status --current-filename))/secrets.fish
test -f $secrets; and source $secrets
