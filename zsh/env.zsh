## ENVPUPPET Setup
export EDITOR=vim
export PAGER=less

#Needed for rake tasks with rspec core
export RUBYOPT=rubygems

# Bind incremental history search
bindkey "^r" history-incremental-search-backward

# Use arrows to search back/forth in history search
bindkey "\e[B" history-search-forward
bindkey "\e[A" history-search-backward

# Ensure history is shared
setopt inc_append_history

# Direnv
eval "$(direnv hook zsh)"
