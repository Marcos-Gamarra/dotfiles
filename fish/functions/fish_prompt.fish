function fish_prompt --description 'Write out the prompt'
    set theme (cat ~/.theme)
    if [ "$theme" = "dark" ]
        set -g decoration_fg (set_color '#D8DEE9')
        set -g decoration_bg (set_color -o -b '#D8DEE9')
        set -g fg (set_color '#2E3440')
    else
        set -g decoration_fg (set_color '#3b4252')
        set -g decoration_bg (set_color -o -b '#3b4252')
        set -g fg (set_color '#D8DEE9')
    end

    
    set -l color2_fg (set_color '#858585')
    set -l color2_bg (set_color -o -b '#858585')

    set -l green_fg (set_color '#afd700')

    set -l reset (set_color normal)

    command git status 2&>/dev/null
    if test $status -eq 0
        set -l branch (git status | head -n 1 | string split ' ' | tail -n 1) 
        set -f dirty (git -C . status --porcelain)
        if test -n "$dirty"
            set -f dirty ' '
        end
        set -f git_info (printf " $color2_fg$reset$color2_bg$branch$dirty$reset$color2_fg$reset")
    end


    set -l env (echo $VIRTUAL_ENV)
    if test -n $env
        set -gx VIRTUAL_ENV_DISABLE_PROMPT 
        set -l env_path (echo $VIRTUAL_ENV | string split '/' | tail -n 1)
        set -f venv_info (printf " $color2_fg$reset$color2_bg ($env_path)$reset$color2_fg$reset ")
    end

    printf "$decoration_fg╭─$fg$decoration_bg$(prompt_pwd -D 3)$reset$decoration_fg$reset$git_info$venv_info\n"
    printf "$decoration_fg╰─ $reset"

end
