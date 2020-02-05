#############
# oh-my-zsh #
#############

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# time that oh-my-zsh is loaded.
#ZSH_THEME="garylarizza"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Comment this out to disable weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
