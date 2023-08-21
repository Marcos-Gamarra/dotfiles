set -l red "#e78284"
set -l base "#303446"

swaymsg client.focused              $red       $red       $base       $base      $red
swaymsg client.focused_inactive     $red       $red       $base       $base      $red
swaymsg mode "resize"
