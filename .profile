. "$HOME/.cargo/env"

# start sway
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi


