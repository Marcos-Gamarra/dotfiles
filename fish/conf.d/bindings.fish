set fish_key_bindings fish_vi_key_bindings
bind -M insert \ca accept-autosuggestion
bind -M default _ beginning-of-line
bind -M default = end-of-line
bind -M default s forward-jump
bind -M default h backward-jump
bind -M default S repeat-jump
bind -M default H repeat-jump
bind -M default e_ backward-kill-line
bind -M default e= kill-line
bind -M default ee kill-whole-line
bind -M default p fish_clipboard_paste
bind -M default j fish_clipboard_copy


bind -M default n forward-jump forward-jump


