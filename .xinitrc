#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# custom X settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# keymapping
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# custom fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/TTF/
xset fp rehash

# turn off the annoying beep
xset b off
