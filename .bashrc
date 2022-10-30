export LD_LIBRARY_PATH=/usr/local/lib
export NODE_PATH=/home/hi/.local/downloads/node-v16.17.0-linux-x64/bin
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/downloads/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME:$NODE_PATH"
#export ANDROID_HOME=$HOME/.android-sdk
#export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
#export PATH=$ANDROID_HOME/emulator/:$PATH
#export PATH=$ANDROID_HOME/platform-tools/:$PATH
export CHROME_EXECUTABLE=chromium

set-window-title() {
  echo -en "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}

if [[ "$PROMPT_COMMAND" ]]; then
  export PROMPT_COMMAND="$PROMPT_COMMAND;set-window-title"
else
  export PROMPT_COMMAND=set-window-title
fi

alias cd="z"
alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias chromium="chromium --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias cpath="pwd | wl-copy -n"                                                       
alias c="clear"
alias rm="rm -i"
alias l="lsd"
alias lt="lsd --tree"
alias la="lsd -a"
alias ll="lsd -l"
PROMPT_DIRTRIM=3
export EDITOR=nvim

GREEN="\[\e[1;32m\]"
RESET="\[\e[0m\]"

PS1="${GREEN}\w  ${RESET}" 
#PS1='[\u@\h \w]\$ '
. "$HOME/.cargo/env"




eval "$(zoxide init bash)"
