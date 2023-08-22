function fish_prompt --description 'Write out the prompt'
    set -g decoration_fg (set_color '#c6d0f5')
    set -g decoration_bg (set_color -o -b '#c6d0f5')
    set -g fg (set_color '#4c4f69')
    
    set -l color2_fg (set_color '#c6d0f5')
    set -l color2_bg (set_color -o -b '#c6d0f5')

    set -l reset (set_color normal)

    set -l left_sep (set_color '#c6d0f5')''$reset
    set -l right_sep (set_color '#c6d0f5')''$reset
    set -l folder_icon (set_color '#1e66f5'; set_color -o -b '#c6d0f5')' '$reset
    set -l current_dir (set_color '#303446'; set_color -o -b '#c6d0f5'; prompt_pwd -D 3)$reset
    set -l command_icon (set_color '#a6d189')' '$reset
    set -l branch_icon (set_color '#df8e1d')' '$reset
    set -l clean_icon (set_color '#179299'; set_color -o -b '#c6d0f5')' '$reset
    set -l dirty_icon (set_color '#d20f39'; set_color -o -b '#c6d0f5')' '$reset

    # git stuff
    command git status 2&>/dev/null
    if test $status -eq 0
        set -l current_branch (git status | head -n 1 | string split ' ' | tail -n 1)
        set -l branch (set_color '#303446'; set_color -o -b '#c6d0f5';)$current_branch$reset 
        set -f dirty (git -C . status --porcelain)
        if test -n "$dirty"
            set -f dirty $dirty_icon
        else
            set -f dirty $clean_icon
        end
        set -f git_info (printf " $color2_fg$reset$color2_bg$branch_icon$branch$dirty$reset$color2_fg$reset")
    end


    # python virtualenv info
    #set -l env (echo $VIRTUAL_ENV)
    #if test -n $env
    #    set -gx VIRTUAL_ENV_DISABLE_PROMPT 
    #    set -l env_path (echo $VIRTUAL_ENV | string split '/' | tail -n 1)
    #    set -f venv_info (printf " $color2_fg$reset$color2_bg ($env_path)$reset$color2_fg$reset ")
    #end

    printf "$decoration_fg╭─$left_sep" 
    printf "$folder_icon"
    printf "$current_dir"
    printf "$right_sep$git_info$venv_info\n" 
    printf "$decoration_fg╰─$command_icon"

end
