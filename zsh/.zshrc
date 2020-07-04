# load profile (shell independent configs)
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
PROMPT="${ret_status} %{$fg[cyan]%}%c%{$reset_color%} [$AWS_VAULT] $(git_prompt_info) "

# Work related
export TF_VAR_bastion_username="matei.micu.at.mambu.com"
export TF_VAR_bastion_private_key_path="~/.ssh/id_rsa"
export TF_VAR_bastion_agent=false
export PATH="$PATH:~/git/infrastructure-tools/bin"
export PATH="$PATH:/usr/local/kubebuilder/bin"
export PATH="/usr/local/tflint/bin:$PATH"
