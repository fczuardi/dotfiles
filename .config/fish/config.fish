# aliases
source ~/.config/fish/aliases.fish

# Vim key bindings
fish_vi_key_bindings

# thefuck
env SHELL=/usr/bin/fish thefuck --alias | source

# github ssh key
function github
  eval (ssh-agent -c)
  ssh-add
end

