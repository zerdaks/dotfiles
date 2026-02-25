# custom colors for jq
set -x JQ_COLORS '36;1:35;1:33;1:34;1:38;1:32;1:90;1:97;1:49'

# AWS aliases
alias awsme="aws sts get-caller-identity"
alias awsin="aws sso login"
alias awsout="aws sso logout"
alias awsprofile 'export AWS_PROFILE=$(aws configure list-profiles | fzf)'

# Kubernetes aliases and functions

alias ns 'kubens | fzf | xargs -I {} kubens {}'
alias ctx 'kubectx | fzf | xargs -I {} kubectx {}'

alias ctldeljobs 'kubectl delete job $(__fzf_jobs)'
alias ctldelpods 'kubectl delete pod $(__fzf_pods)'
alias ctldeployments 'kubectl get deployments'
alias ctldescribe 'kubectl describe pod $(__fzf_pods)'
alias ctllogs '__ctl_logs'
alias ctlevents 'kubectl get events --field-selector involvedObject.name=$(__fzf_pods)'
alias ctlnamespace 'kubectl config view --minify -o jsonpath="{.contexts[0].context.namespace}"'
alias ctljobs 'kubectl exec -it $(__fzf_jobs) -- /bin/sh'
alias ctlpods 'kubectl exec -it $(__fzf_pods) -- /bin/sh'
alias ctlsecrets 'kubectl get secret $(__fzf_secrets) -o json | jq -r ".data | to_entries[] | \"\(.key): \(.value | @base64d)\""'

function __ctl_logs
    set pod (__fzf_pod)
    kubectl logs $pod >> "$pod.log"
end

function __fzf_pod
    kubectl get pods | fzf --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

function __fzf_jobs
    kubectl get jobs | fzf --multi --bind 'ctrl-r:reload(kubectl get jobs)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

function __fzf_pods
    kubectl get pods | fzf --multi --bind 'ctrl-r:reload(kubectl get pods)' --header "Press 'ctrl-r' to reload" | awk '{print $1}'
end

function __fzf_secrets
    kubectl get secrets | fzf --header "Select a secret to view" | awk '{print $1}'
end

# Claude configuration
set -x CLAUDE_CODE_USE_BEDROCK 1
set -x ANTHROPIC_MODEL us.anthropic.claude-opus-4-6-v1
set -x ANTHROPIC_SMALL_FAST_MODEL us.anthropic.claude-haiku-4-5-20251001-v1:0
set -x CLAUDE_CODE_MAX_OUTPUT_TOKENS 4096
set -x MAX_THINKING_TOKENS 1024
