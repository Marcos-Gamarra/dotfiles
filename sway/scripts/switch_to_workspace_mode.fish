set -l green "#a6da95"
set -l base "#303446"

swaymsg client.focused              $green       $green       $base       $base      $green
swaymsg client.focused_inactive     $green       $green       $base       $base      $green
swaymsg mode "workspace"
