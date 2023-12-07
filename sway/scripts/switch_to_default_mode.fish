set -l base "#303446"
set -l border "#8caaee"
set -l bg "#7aa2f7"
set -l indicator "#f2d5cf"

swaymsg client.focused              $border      $bg        $base     $indicator      $border
swaymsg client.focused_inactive     $border      $border    $base     $indicator      $border

swaymsg mode "default"
