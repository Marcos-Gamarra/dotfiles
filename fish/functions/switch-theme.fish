function switch-theme
    if test $THEME = "dark" 
        set -Ux THEME "light"
        dconf write /org/gnome/desktop/interface/color-scheme \'prefer-light\'
        fish_config theme save "catppuccin_latte"
        cp ~/.config/foot/light.ini ~/.config/foot/foot.ini
    else
        set -Ux THEME "dark"
        dconf write /org/gnome/desktop/interface/color-scheme \'prefer-dark\'
        fish_config theme save "catppuccin_mocha"
        cp ~/.config/foot/dark.ini ~/.config/foot/foot.ini
    end
end
