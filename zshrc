export PATH=/usr/local/bin:$HOME/.local/bin:$HOME/Library/Python/3.7/bin:$HOME/.gem/ruby/2.3.0/bin:/opt/homebrew/bin:$PATH

# See https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

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
autoload -U compinit && compinit
export MYZSH=$HOME/src/dotfiles/zsh
for config_file ($MYZSH/**/*.zsh ) source $config_file
for config_file ($MYZSH/functions/* ) source $config_file

fpath=($MYZSH/functions $fpath)

if [[ -z $TMUX ]]; then
  tmux attach -d
fi

# Set vim bindings
set -o vi

# GPG enable with ssh support
#gpg-agent --daemon --enable-ssh-support

# Setup direnv
export DIRENV_BASH=/bin/bash
eval "$(direnv hook zsh)"

# Setup fzf fuzzy finder
# NOTE: If CTRL-T is not working run /usr/local/opt/fzf/install to install dependencies
# NOTE: May also be located at /opt/homebrew/Cellar/fzf/0.45.0/install
# NOTE: Run ~/.fzf/install to generate ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview-window 'right:50%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

source "${HOME}/.fzf/shell/key-bindings.zsh"
source "${HOME}/.fzf/shell/completion.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

POWERLEVEL9K_HOST_NAME=$(hostname)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
