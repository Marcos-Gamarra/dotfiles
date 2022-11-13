function efe
    set -g current_cmd (commandline -b)
    set -l prompt "$(fish_prompt)$current_cmd"
    set fish_bind_mode insert 

    read -s -n 2 -P $prompt
    commandline -f repaint   
end
