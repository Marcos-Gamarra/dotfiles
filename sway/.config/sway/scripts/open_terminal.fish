#!/usr/bin/fish

if test $THEME = "dark"
    foot -c ~/.config/foot/dark.ini
else
    foot -c ~/.config/foot/light.ini
end
