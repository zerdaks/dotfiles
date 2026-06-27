# AWS aliases
alias awsme "aws sts get-caller-identity"
alias awsin "aws sso login"
alias awsout "aws sso logout"
alias awsprofile 'set -gx AWS_PROFILE (aws configure list-profiles | fzf)'
