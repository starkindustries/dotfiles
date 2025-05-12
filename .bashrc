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

# *************************
# Custom Audio Controls
# *************************

# Note: view audio sinks with `pactl list sinks short`
set_default_sink() {
    local audio_type="$1"
    local sink_number=$(pactl list sinks short | grep "$audio_type" | awk '{print $1}')
    if [[ -z "$sink_number" ]]; then
        echo "Error: No sink found for type: $audio_type"
        return 1
    fi
    pactl set-default-sink "$sink_number"
    echo "Default sink set to $audio_type (sink number: $sink_number)"
}

alias audio='pavucontrol'
alias audio-hdmi='set_default_sink hdmi'
alias audio-blue='set_default_sink blue'

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
