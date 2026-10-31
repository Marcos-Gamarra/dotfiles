#!/usr/bin/env fish

set options \
"Volume Up" \
"Volume Down" \
"Toggle Mute" \
"Brightness Up" \
"Brightness Down"

# Pipe the options into Fuzzel's dmenu mode
set choice (printf "%s\n" $options | fuzzel --dmenu --prompt "System  " --lines 5)

# Execute the corresponding command based on the selection
switch $choice
    case "Volume Up"
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
    case "Volume Down"
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    case "Toggle Mute"
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    case "Brightness Up"
        ddcutil -d 1 setvcp 10 + 5
    case "Brightness Down"
        ddcutil -d 1 setvcp 10 - 5
end
