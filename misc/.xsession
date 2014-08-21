if [ $(hostname) = "chiba" ]; then
  xrandr --output VGA1 --auto --above LVDS1 --mode 1920x1080
fi

setxkbmap -layout gb
xmodmap ~/.xmodmaprc &

export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
export XIM_PROGRAM="uim"
uim-xim &
export XMODIFIERS="@im=uim"

eval $(cat ~/.fehbg) &

while true; do
  xsetroot -name "$(date +'%a %b %d %H:%M')"
  sleep 60
done &

exec dwm
