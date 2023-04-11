#function fish_mode_prompt
#    set -l fg (set_color '#D8DEE9')
#    set -l bg (set_color -o -b '#D8DEE9')
#    set -l reset (set_color normal)
#    printf "╭─$fg$reset$bg"
#    switch $fish_bind_mode
#      case default
#        printf 'n'
#      case insert
#        printf "$red"
#        printf 'i'
#      case replace_one
#        printf 'r'
#      case visual
#        printf 'v'
#      case '*'
#        printf '?'
#    end
#    printf "$reset$fg$reset "
#end
