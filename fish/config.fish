if status is-interactive
    # Emulates vim's cursor shape behavior
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    alias battery="cat /sys/class/power_supply/BAT0/capacity"

    alias rm="rm -i"

    alias c="clear"
    alias e="z"
    alias t="lsd"
    alias tt="lsd --tree"
    alias ta="lsd -a"
    alias tl="lsd -l"

    trap "handle-switch-theme-signal" SIGUSR1

    set -x EDITOR nvim
    zoxide init fish | source

end 


