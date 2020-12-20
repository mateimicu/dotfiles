export EDITOR=nvim
alias nv="nvim"

# Kubectl
export KUBECONFIG=$KUBECONFIG:~/.kube/config
alias k=kubectl

# stop Telepresence from collecting data
export SCOUT_DISABLE=1


# Terragrunt & Terraform
export TERRAGRUNT_DOWNLOAD="$HOME/.terragrunt-cache"
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"


# pipenv completion
eval "$(pipenv --completion)"

# AWS
export AWS_ASSUME_ROLE_TTL=1h

# Golang
export PATH="$HOME/go/bin:$PATH"

# WORK
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
