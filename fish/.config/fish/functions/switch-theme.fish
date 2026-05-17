function switch-theme
    if test $THEME = "dark" 
        dconf write /org/gnome/desktop/interface/color-scheme \'prefer-light\'
        fish_config theme save "catppuccin_latte"
        cp ~/.config/foot/light.ini ~/.config/foot/foot.ini
        sed -i 's/mocha/latte/g' ~/.config/alacritty/alacritty.toml
        set -x THEME "light"
        set -Ux FZF_DEFAULT_OPTS "\
            --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
            --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
            --color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
            --color=selected-bg:#bcc0cc \
            --multi"
    else
        dconf write /org/gnome/desktop/interface/color-scheme \'prefer-dark\'
        fish_config theme save "catppuccin_mocha"
        cp ~/.config/foot/dark.ini ~/.config/foot/foot.ini
        sed -i 's/latte/mocha/g' ~/.config/alacritty/alacritty.toml
        set -x THEME "dark"
        set -Ux FZF_DEFAULT_OPTS "\
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
            --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
            --color=selected-bg:#45475a \
            --multi"
    end
end
