#
# .bashrc
#

# https://github.com/starkindustries/dotfiles


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias wlcopy='wl-copy'
alias gits='git status'
alias firefox='nohup firefox > /dev/null 2>&1 &'
alias lock='hyprlock'
alias audio='pavucontrol'

# Add a boolean variable to enable/disable color prompt
# Set to true to enable, false to disable
enable_color_prompt=true

# Define ANSI color code variables
GREEN="\[\e[32m\]"  # Start green color
CLEAR="\[\e[0m\]"   # Reset color

# Set the prompt with color conditionally
if "$enable_color_prompt"; then
    # Set a green prompt
    PS1="[${GREEN}\u@\h \W${CLEAR}]\$ "
else
    PS1='[\u@\h \W]\$ '
fi

# Use vi key bindings
set -o vi
