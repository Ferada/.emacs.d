setxkbmap -layout gb
xmodmap ~/.xmodmaprc &

export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# scim -d &
# export XMODIFIERS="@im=UIM"
# export XIM_PROGRAM="uim"
# export GTK_IM_MODULE=uim
# export QT_IM_MODULE=uim 

eval $(cat ~/.fehbg) &

while true; do
  xsetroot -name "$(date +'%a %b %d %H:%M')"
  sleep 60
done &

exec dwm
