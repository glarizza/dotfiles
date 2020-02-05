#!/bin/bash

# Set defaults and variables
: "${USERNAME:=glarizza}"
: "${HOMEDIR:=/Users/${USERNAME}}"
SRCDIR="/Users/${USERNAME}/src"
DOTFILES="${SRCDIR}/dotfiles"

# Create required directories
[[ ! -d "${SRCDIR}" ]] && mkdir -p "${SRCDIR}"

# Dotfiles Configuration
[[ ! -d "${DOTFILES}" ]] && git clone git@github.com:glarizza/dotfiles.git "${DOTFILES}"
[[ ! -h "${HOMEDIR}/.vimrc" ]] && ln -s "${DOTFILES}/vimrc" "${HOMEDIR}/.vimrc"
[[ ! -h "${HOMEDIR}/.zshrc" ]] && ln -s "${DOTFILES}/zshrc" "${HOMEDIR}/.zshrc"
[[ ! -h "${HOMEDIR}/.p10k.zsh" ]] && ln -s "${DOTFILES}/p10k.zsh" "${HOMEDIR}/.p10k.zsh"
[[ ! -h "${HOMEDIR}/.tmux.conf" ]] && ln -s "${DOTFILES}/tmux.conf" "${HOMEDIR}/.tmux.conf"
[[ ! -d "${HOMEDIR}/.vim/colors" ]] && mkdir -p "${HOMEDIR}/.vim/colors" && git clone git://github.com/altercation/vim-colors-solarized.git "${HOMEDIR}/src/vim-colors-solarized" && cp "${HOMEDIR}/src/vim-colors-solarized/colors/solarized.vim" "${HOMEDIR}/.vim/colors/solarized.vim"

# ZSH Configuration
[[ ! -d "${HOMEDIR}/.oh-my-zsh" ]] && git clone git@github.com:glarizza/oh-my-zsh.git "${HOMEDIR}/.oh-my-zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
[[ ! -d "${HOMEDIR}/.oh-my-zsh/themes/powerlevel10k" ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOMEDIR}/oh-my-zsh/themes/powerlevel10k"
if [[ "/bin/zsh" != "${SHELL}" ]]; then
    chsh -s /bin/zsh
    echo "NOTE: You will need to restart for the ZSH shell change to take effect"
fi

# Homebrew and application setup
if ! which brew > /dev/null 2>&1
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
cd "${DOTFILES}" && brew bundle
