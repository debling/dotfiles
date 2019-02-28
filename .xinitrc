#!/usr/bin/sh

# Disable bell and touchpad
xset b off &
xinput disable "SynPS/2 Synaptics TouchPad" &

# Set desktop background color
xsetroot -solid "#fdf6e3" &

# Export Xresources settings
xrdb -merge "$HOME"/.Xresources &

# Run desktop notification daemon
dunst &

# Hide mouse pointer when inactive
unclutter --timeout 1 --jitter 2 &

# Hood screen locker as X screensaver
xss-lock sflock &

# Set keyboard layout and key repeat rate
setxkbmap -layout br -model thinkpad
xmodmap "$HOME/.Xmodmap"
xset r rate 160 60 &
xcape -e 'Control_L=Escape' &

# dwm statusbar script
"$HOME"/Scripts/dwmstart &

compton &

exec dwm
