if test -z $(swaymsg -t get_workspaces | jq '.[] .name' | rg 1)
    swaymsg [app_id="chromium"] focus
    swaymsg focus left
    swaymsg move left
    swaymsg [app_id="chromium"] move container to workspace 1
else
    swaymsg splith
    swaymsg [app_id="chromium"] move container to workspace current
end
