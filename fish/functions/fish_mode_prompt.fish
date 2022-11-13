function fish_mode_prompt
    set -l fg (set_color '#875f5f')
    set -l bg (set_color -o -b '#875f5f')
    set -l reset (set_color normal)
    printf "$fg$reset$bg"
    switch $fish_bind_mode
      case default
        printf 'n'
      case insert
        printf "$red"
        printf 'i'
      case replace_one
        printf 'r'
      case visual
        printf 'v'
      case '*'
        printf '?'
    end
    printf "$reset$fg$reset "
end
