#!/usr/bin/fish

if test $THEME = "dark"
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
else
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita
end
