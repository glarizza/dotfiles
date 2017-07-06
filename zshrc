zsh_cache=${HOME}/.zsh_cache
vim_swap=${HOME}/.vimswp

[[ ! -d $zsh_cache ]] && mkdir -p $zsh_cache
[[ ! -d $vim_swap ]] && mkdir -p $vim_swap

# Quit bloating .zshrc with shit
export MYZSH=$HOME/src/dotfiles/zsh
for config_file ($MYZSH/**/*.zsh ) source $config_file
for config_file ($MYZSH/functions/* ) source $config_file

fpath=($MYZSH/functions $fpath)

autoload -U compinit && compinit

if [[ -z $TMUX ]]; then
  tmux attach -d
fi

# Set vim bindings
set -o vi

# GPG enable with ssh support
gpg-agent --daemon --enable-ssh-support
