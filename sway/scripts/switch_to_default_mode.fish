set -l base "#303446"
set -l blue "#8caaee"

swaymsg client.focused              $blue       $blue       $base       $base      $blue
swaymsg client.focused_inactive     $blue       $blue       $base       $base      $blue
swaymsg mode "default"
