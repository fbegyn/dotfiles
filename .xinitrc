xrdb .Xresources

dbus-update-activation-environment --systemd DISPLAY

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
eval $(ssh-agent)

exec i3
