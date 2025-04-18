# Load autocompletion for kubectl
if which kubectl > /dev/null 2>&1 ; then
  source <(kubectl completion zsh)
fi

# Load zsh-autocompletion
source $HOME/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh
