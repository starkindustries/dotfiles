#
# .zshrc
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user01/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# *******************************************
# My Custom Settings
# https://github.com/starkindustries/dotfiles
# *******************************************

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias wlcopy='wl-copy'
alias gits='git status'
alias firefox='nohup firefox > /dev/null 2>&1 &'
alias lock='hyprlock'
alias bluetooth='bluetoothctl'
alias jbl='bluetoothctl connect C8:2B:6B:10:4D:60 && sleep 2 && sink blue'
alias sony='bluetoothctl connect 80:99:E7:75:0A:DA && sleep 2 && sink blue'
alias logout='hyprctl dispatch exit'
alias shot='hyprshot -m region --clipboard-only'

# *************************
# Git Wrapper Functions
# *************************

# Git commit shortcut
gitc() {
  msg="Update at $(date '+%Y-%m-%d %H:%M:%S')"
  if [ -z "$1" ]; then
    echo "No parameter provided - defaulting to: \"$msg\""
    git commit -m "$msg" && git push
  elif [ "$1" = "--commit-all" ]; then
    echo "Committing all changes - defaulting to: \"$msg\""
    git commit -am "$msg" && git push
  else
    git commit -m "$1" && git push
  fi
}

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

# Note: set the audio sink with this function. Here are some
# example commands: `sink blue` or `sink hdmi`
sink() {
    local target="$1"
    if [[ -z "$target" ]]; then
        echo "Error: no target provided, e.g. 'blue' or 'hdmi'"
        return 1
    fi
    set_default_sink $target 
}

alias audio='pavucontrol'

# *************************
# Zshell Prompt Settings
# *************************

# Note: to view a list of all prompt style/themes:
# prompt -l
autoload -Uz promptinit && promptinit
prompt off

# *************************
# Other Settings
# *************************

# Keep these lines only if you need to use NVM (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Update PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/android-studio/bin"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/.local/watchman-v2025.05.26.00-linux/bin"

# Set Hyprshot Screenshot Directory
# https://github.com/Gustash/Hyprshot
HYPRSHOT_DIR=~/screenshots

neofetch

echo "Reminder: If you feel the urge to scroll, shift your focus towards a creative goal"
