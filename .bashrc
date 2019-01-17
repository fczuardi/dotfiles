#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi

if [ -e ~/.stoq.aliases ] ; then
   source ~/.stoq.aliases
fi

# Prompt
#------------------------------------------------
BASIC_PROMPT='[\u@\h \W]\$'
# PROMPT_COLOR='0;32' #green
# PROMPT_COLOR='0;35' #purple
PROMPT_COLOR='0;36' #cyan
# PROMPT_COLOR='100' #dark gray

# PS1="\e[${PROMPT_COLOR}m${BASIC_PROMPT}\e[m "
PS1="${BASIC_PROMPT} "

# Default apps
#------------------------------------------------
EDITOR=/usr/bin/vim
PAGER=/usr/bin/less

# Less default settings
# ----------------------------------------
# F: Quit if entire file fits on first screen.
# R: Output "raw" control characters.
# X: Don't use termcap init/deinit strings.
# W: Highlight first new line after any forward movement.
# S: Chop (truncate) long lines rather than wrapping.
LESS=FRXWS

# # fzf completion and key bindings
# source /usr/share/fzf/completion.bash
# source /usr/share/fzf/key-bindings.bash
# export FZF_CTRL_T_COMMAND='ag -g "" --hidden --ignore .ssb --ignore .git --ignore .cache --ignore .vscode* --ignore node_modules'
#
# stoqenv

# echo "bashrc end"
