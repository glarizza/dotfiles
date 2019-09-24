# Brewfile, similar to a Gemfile but for Homebrew
# Go to https://github.com/Homebrew/homebrew-bundle for more info
# Visit https://github.com/MikeMcQuaid/strap for system-level bootstrapping

cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'caskroom/homebrew-cask' || true
tap 'caskroom/versions' || true
tap 'homebrew/bundle'

# Some base-level stuff
brew 'git'
brew 'bash-completion'
brew 'tree'
brew 'node'
cask 'java'
brew 'wget'
brew 'thefuck'

# Ruby Time
brew 'rbenv'
brew 'ruby-build'

# Homebrew Bootstrap to assist setting up Ruby
tap 'github/bootstrap'
#brew 'bootstrap-rbenv-ruby'

# Casks
cask 'puppetlabs/puppet/puppet-agent'
cask 'puppetlabs/puppet/pdk'
cask 'virtualbox'
cask 'vagrant'
cask 'vagrant-manager'
cask 'vlc'
cask 'google-chrome'
cask 'dropbox'
cask 'slack'
cask '1password'
cask 'sizeup'
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
brew 'tree'
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

# Fuzzy finder
brew 'fzf'
brew 'fd'
brew 'bat'

# Text input for git
brew 'tig'

# Direnv for environment files
brew 'direnv'
