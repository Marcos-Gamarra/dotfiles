function fish_prompt --description 'Write out the prompt'
    set -l grey_fg (set_color '#858585')
    set -l grey_bg (set_color -o -b '#858585')

    set -l red_fg (set_color '#875f5f')
    set -l red_bg (set_color -o -b '#875f5f')

    set -l green_fg (set_color '#afd700')

    set -l reset (set_color normal)

    command git status 2&>/dev/null
    if test $status -eq 0
        set -l branch (git status | head -n 1 | string split ' ' | tail -n 1) 
        set -f dirty (git -C . status --porcelain)
        if test -n "$dirty"
            set -f dirty ' '
        end
        set -f git_info (printf " $red_fg$reset$red_bg$branch$dirty$reset$red_fg$reset")
    end


    set -l env (echo $VIRTUAL_ENV)
    if test -n $env
        set -gx VIRTUAL_ENV_DISABLE_PROMPT 
        set -l env_path (echo $VIRTUAL_ENV | string split '/' | tail -n 1)
        set -f venv_info (printf " $red_fg$reset$red_bg ($env_path)$reset$red_fg$reset ")
    end

    printf "$grey_fg$reset$grey_bg$(prompt_pwd -D 3)$reset$grey_fg$reset$git_info$venv_info\n"
    printf "╰─ "

end
