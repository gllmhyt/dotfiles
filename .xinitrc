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
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

# keymapping
[[ -f ~/.Xmodmap ]] && xmodmap "${HOME}/.Xmodmap"

# custom fonts
xset +dpms +fp /usr/share/fonts/local/,/usr/share/fonts/TTF/,$HOME/.fonts/
xset fp rehash

# turn off the annoying beep
xset b off

# keyring
if [ "$0" = "/etc/gdm/Xsession" ]; then
    eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK GPG_AGENT_INFO GNOME_KEYRING_CONTROL GNOME_KEYRING_PID
    export SSH_AGENT_PID=$GNOME_KEYRING_PID
fi
