if status is-interactive
    alias battery="cat /sys/class/power_supply/BAT0/capacity"
    alias chromium="chromium --enable-features=UseOzonePlatform --ozone-platform=wayland"
    alias c="clear"

    alias rm="rm -i"

    alias e="z"
    alias t="lsd"
    alias tt="lsd --tree"
    alias ta="lsd -a"
    alias tl="lsd -l"
    set -x EDITOR nvim
    zoxide init fish | source
end 
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec sway
    end
end
