#Convenience aliases
alias stroke='/Applications/Utilities/Network\ Utility.app/Contents/Resources/stroke'
alias gitx='/Applications/GitX.app/Contents/Resources/gitx'

# Tmux Stuff
alias tmuxconnect='tmux attach -t 0'

# Because
alias fucking=sudo

# Total disk usage for current folder
alias use="/bin/ls -1A | tr '\n' '\0' | xargs -0 du -sk | sort -n"

# Webserver
alias webserver="python -m SimpleHTTPServer"

# Bundler shortcuts
alias b='bundle'
alias bi='b install --path vendor'
alias bu='b update'
alias be='b exec'
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias k='kubectl'
