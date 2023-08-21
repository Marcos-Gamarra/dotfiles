function fish_prompt --description 'Write out the prompt'
    set -g decoration_fg (set_color '#8caaee')
    set -g decoration_bg (set_color -o -b '#8caaee')
    set -g fg (set_color '#303446')
    
    set -l color2_fg (set_color '#737994')
    set -l color2_bg (set_color -o -b '#737994')

    set -l reset (set_color normal)

    # git stuff
    command git status 2&>/dev/null
    if test $status -eq 0
        set -l branch (git status | head -n 1 | string split ' ' | tail -n 1) 
        set -f dirty (git -C . status --porcelain)
        if test -n "$dirty"
            set -f dirty ' '
        else
            set -f dirty ' '
        end
        set -f git_info (printf " $color2_fg$reset$color2_bg $branch$dirty$reset$color2_fg$reset")
    end


    # python virtualenv info
    set -l env (echo $VIRTUAL_ENV)
    if test -n $env
        set -gx VIRTUAL_ENV_DISABLE_PROMPT 
        set -l env_path (echo $VIRTUAL_ENV | string split '/' | tail -n 1)
        set -f venv_info (printf " $color2_fg$reset$color2_bg ($env_path)$reset$color2_fg$reset ")
    end

    printf "$decoration_fg╭─$fg$decoration_bg $(prompt_pwd -D 3)$reset$decoration_fg$reset$git_info$venv_info\n"
    printf "$decoration_fg╰─ $reset"

end
