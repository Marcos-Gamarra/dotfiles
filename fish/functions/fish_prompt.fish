function fish_prompt --description 'Write out the prompt'
    set -l fg (set_color '#875f5f')
    set -l bg (set_color -o -b '#875f5f')
    set -l reset (set_color normal)
    
    echo "$fg $reset$bg$(prompt_pwd -D 3) $reset$fg$reset "
end
