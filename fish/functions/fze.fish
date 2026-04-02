function fze
    set -l include_hidden 0
    set -l dir_path ./

    # Parse arguments
    for arg in $argv
        if test "$arg" = "-h"
            set include_hidden 1
        else
            set dir_path "$arg"
        end
    end

    # Build fd command
    set -l fd_cmd "fd --type d"
    if test $include_hidden -eq 1
        set fd_cmd "$fd_cmd --hidden"
    end

    # Execute fd and fzf
    set dir (
        eval $fd_cmd --base-directory "$dir_path" | 
        fzf --preview "lsd --color always --icon always {}" \
            --preview-window=top:50% \
            --bind "ctrl-j:preview-up,ctrl-b:preview-down"
    )

    # Change directory if valid selection
    if test -n "$dir"
        set full_path (realpath -- "$dir_path/$dir")
        z "$full_path"
    end
end
