# Brewfile, similar to a Gemfile but for Homebrew
# Go to https://github.com/Homebrew/homebrew-bundle for more info
# Visit https://github.com/MikeMcQuaid/strap for system-level bootstrapping

cask_args appdir: '/Applications'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'homebrew/aliases'
tap 'homebrew/autoupdate'
tap 'homebrew/cask'
# tap 'homebrew/cask-drivers'
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'
tap 'homebrew/bundle'
tap 'hashicorp/tap'
tap '1password/tap'

# Some base-level stuff
brew 'git'
brew 'bash-completion'
brew 'tree'
brew 'node'
brew 'wget'
brew 'thefuck'

# Ruby Time
brew 'rbenv'
brew 'ruby-build'

# VPN
brew 'tailscale'

# Homebrew Bootstrap to assist setting up Ruby
tap 'github/bootstrap'
#brew 'bootstrap-rbenv-ruby'

# Casks
cask 'puppetlabs/puppet/puppet-agent'
cask 'puppetlabs/puppet/pdk'
cask 'puppetlabs/puppet/puppet-bolt'
cask 'vagrant'
cask 'vagrant-manager'
cask 'vlc'
cask 'google-chrome'
cask 'slack'
cask '1password'
# Tiling window manager to replace SizeUp which doesn't work correctly on Apple Silicon
cask 'rectangle'
cask 'iterm2'
cask 'dash'
cask 'macdown' #markdown viewer
# To convert mov to gif
# https://gist.github.com/dergachev/4627207
cask 'xquartz'
cask 'fluid'
cask 'visual-studio-code'
brew 'gifsicle'
brew 'curl'
brew 'gawk'
brew 'wget'
brew 'zsh'
brew 'nmap'
brew 'tmux'
brew 'rust'
brew 'libxml2'
brew 'libxslt'
brew 'libiconv'
brew 'gitlab-runner'
brew 'imagemagick'
brew 'watch'

# Native OS X copying in tmux
brew 'reattach-to-user-namespace'

# Docker and Podman
cask 'docker'
brew 'podman'

# A command to download mac store app
# http://www.softantenna.com/wp/mac/mas-cli/
# https://github.com/argon/mas
tap 'argon/mas'
brew 'mas' # run download_apps later on

#go
brew 'go'

# python
brew 'python'
brew 'python3'
brew 'python@3.10'
brew 'python@3.11'

# Fuzzy finder
brew 'fzf'
brew 'fd'
brew 'bat'
brew 'rg'

# Text input for git
brew 'tig'

# Direnv for environment files
brew 'direnv'

# Github CLI
brew 'gh'

# Hashicorp tools
brew 'hashicorp/tap/terraform'
brew 'hashicorp/tap/packer'
brew 'hashicorp/tap/vlt'

# Kubernetes and Holos deps
brew 'hashicorp/tap/vault'
brew 'kubectl'
brew 'helm'
brew 'kustomize'
brew 'gomplate'
brew 'yq'
brew 'jq'
brew 'istioctl'
tap 'homeport/tap'
brew 'homeport/tap/dyff'
brew 'cue-lang/tap/cue'

# NOTE: Protobuf connect should be installed via GO:
#   go install github.com/bufbuild/buf/cmd/buf@latest
#   go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
#   go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
#   go install connectrpc.com/connect/cmd/protoc-gen-connect-go@latest

# Docsy/Hugo site deps
brew 'hugo'

# Stream deck
cask 'elgato-stream-deck'

# Loki logcli
brew 'logcli'

# AWS  and aws-nuke Cli tools
brew 'awscli'
brew 'aws-nuke'

# GnuPG for commit signing
# https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
brew 'gnupg'
brew 'pinentry-mac'

# For enforcing .pre-commit-config.yaml
brew 'pre-commit'

# For FluxCD
tap 'fluxcd/tap'
brew 'fluxcd/tap/flux'

# For testing out GitHub Actions locally
brew 'act'

