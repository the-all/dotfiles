#!/bin/sh
xrdb ~/.Xresources
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="xim"
ibus-daemon -d -x
feh --bg-fill ~/xplanetbackground.png
trayer --edge top --align right --SetDockType true --SetPartialStrut true\
    --expand true --width 10 --height 12 --transparent true --tint 0x000000 --alpha 0 &
volumeicon &
xscreensaver -no-splash &
redshift &
xplanetFX &

exec xmonad
