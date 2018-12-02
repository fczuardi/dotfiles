# default editor
set -gx EDITOR vim

# aliases
source ~/.config/fish/aliases.fish

# Vim key bindings
# fish_vi_key_bindings

# Default key bindings
fish_default_key_bindings

# Alt+D to kill word forward
bind \ed 'kill-word'

# thefuck
env SHELL=/usr/bin/fish thefuck --alias | source

# github ssh key
# function github
#   eval (ssh-agent -c)
#   ssh-add
# end

