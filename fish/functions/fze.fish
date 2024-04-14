function fze 
    if test -z "$argv[1]"
        set argv[1] .
    end

    set dir (fd --type d --hidden "" $argv[1] | 
    fzf --preview "lsd --color always --icon always {}" \
    --preview-window=top:50% \
    --bind "ctrl-j:preview-up,ctrl-b:preview-down")

    if test -n "$dir"
        z $dir
    end
end
