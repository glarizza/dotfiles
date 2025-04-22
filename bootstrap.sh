#!/bin/bash

set -x

# Set defaults and variables
SRCDIR="${HOME}/src"
DOTFILES="${SRCDIR}/dotfiles"

# Create required directories
[[ ! -d "${SRCDIR}" ]] && mkdir -p "${SRCDIR}"

# Dotfiles Configuration
[[ ! -d "${DOTFILES}" ]] && git clone git@github.com:glarizza/dotfiles.git "${DOTFILES}"
[[ ! -d "${HOME}/.fzf" ]] && git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf && echo "Run ~/.fzf/install to configure fzf"
[[ ! -h "${HOME}/.vimrc" ]] && ln -s "${DOTFILES}/vimrc" "${HOME}/.vimrc"
[[ ! -h "${HOME}/.zshrc" ]] && ln -s "${DOTFILES}/zshrc" "${HOME}/.zshrc"
[[ ! -h "${HOME}/.tmux.conf" ]] && ln -s "${DOTFILES}/tmux.conf" "${HOME}/.tmux.conf"
[[ ! -d "${HOME}/.vim/colors" ]] && mkdir -p "${HOME}/.vim/colors"
[[ ! -f "${HOME}/.vim/colors/solarized.vim" ]] && git clone https://github.com/altercation/vim-colors-solarized.git "${HOME}/src/vim-colors-solarized" && cp "${HOME}/src/vim-colors-solarized/colors/solarized.vim" "${HOME}/.vim/colors/solarized.vim"
[[ ! -d "${HOME}/.local/bin" ]] && mkdir -p "${HOME}/.local/bin"

# P10k and ZSH Configuration
[[ ! -d "${HOME}/powerlevel10k" ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/powerlevel10k" && echo "Run 'p10k configure' to setup p10k for the first time"
if [[ "/bin/zsh" != "${SHELL}" ]]; then
    chsh -s /bin/zsh
    echo "NOTE: You will need to restart for the ZSH shell change to take effect"
fi

# Setup ZSH Autocompletion repo
[[ ! -d "${SRCDIR}/zsh-autocomplete" ]] && git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git "${SRCDIR}/zsh-autocomplete"

# Are we running on Debian or macOS?
if grep -q '^ID=debian' /etc/os-release; then
  packages=(fd-find vim bat)
  echo "Running on Debian"
  sudo apt install "${packages[@]}" -y

  [[ ! -h "${HOME}/.local/bin/fd" ]] && ln -s $(which fdfind) ~/.local/bin/fd
  [[ ! -h "${HOME}/.local/bin/bat" ]] && ln -s $(which batcat) ~/.local/bin/bat
else
  echo "Running on macOS..."

  # Check for homebrew and install if not found
  if ! which brew > /dev/null 2>&1
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  cd "${DOTFILES}" && brew bundle
fi

