# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
#gpg-agent --daemon --enable-ssh-support

export PATH=/usr/local/bin:$HOME/.local/bin:/Users/glarizza/Library/Python/3.7/bin:/Users/glarizza/.gem/ruby/2.3.0/bin:$PATH

# Setup direnv
export DIRENV_BASH=/bin/bash
eval "$(direnv hook zsh)"

# Setup fzf fuzzy finder
# NOTE: If CTRL-T is not working run /usr/local/opt/fzf/install to install dependencies
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview-window 'right:50%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/glarizza/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/glarizza/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/glarizza/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/glarizza/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
