if status is-interactive
    # Emulates vim's cursor shape behavior
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    abbr --add battery cat /sys/class/power_supply/BAT0/capacity

    abbr --add rm rm -i

    abbr --add c clear
    abbr --add e z
    abbr --add .. z ..
    abbr --add t lsd
    abbr --add tt lsd --tree
    abbr --add tt1 lsd --tree --depth 1
    abbr --add tt2 lsd --tree --depth 2
    abbr --add tt3 lsd --tree --depth 3
    abbr --add tt4 lsd --tree --depth 4
    abbr --add ta lsd -a
    abbr --add tl lsd -l
    abbr --add n nvim
    
    abbr --add bt bat
    abbr --add btp bat -p

    set -x EDITOR nvim
    zoxide init fish | source
    starship init fish | source


end 
