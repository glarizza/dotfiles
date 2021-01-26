#!/bin/sh

# Pulled from https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41
# Create/Attach-to tmux sessions just for Visual Studio Code
SESSION="vscode`pwd | md5`"
tmux attach-session -d -t $SESSION || tmux new-session -s $SESSION

