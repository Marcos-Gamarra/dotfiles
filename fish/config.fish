if status is-interactive
    # Emulates vim's cursor shape behavior
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    alias battery="cat /sys/class/power_supply/BAT0/capacity"

    alias rm="rm -i"

    alias c="clear"
    alias e="z"
    alias ..="z .."
    alias t="lsd"
    alias tt="lsd --tree"
    alias tt1="lsd --tree --depth 1"
    alias tt2="lsd --tree --depth 2"
    alias tt3="lsd --tree --depth 3"
    alias tt4="lsd --tree --depth 4"
    alias ta="lsd -a"
    alias tl="lsd -l"
    alias n="nvim"

    set -x EDITOR nvim
    zoxide init fish | source
    starship init fish | source


end 
