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
alias blue='bluetoothctl'

# Custom Audio Controls
alias audio='pavucontrol'
# View audio sinks with `pactl list sinks short`
alias audio-hdmi='pactl set-default-sink 24' # Set sound to HDMI (monitor)
alias audio-blue='pactl set-default-sink 27' # Set sound to bluetooth

# Add a boolean variable to enable/disable color prompt
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

# Keep these lines only if you need to use NVM (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
