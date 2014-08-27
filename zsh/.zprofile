#!/bin/zsh

if [ -z "$DISPLAY" ]
then
  export DISPLAY=":0.0"
fi

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]
then
  # eval `dbus-launch --sh-syntax --exit-with-session`

  /usr/bin/dbus-daemon \
    --fork \
    --print-pid \
    --print-address \
    --session | \
  {
    read DBUS_SESSION_BUS_ADDRESS
    read DBUS_SESSION_BUS_PID
    export DBUS_SESSION_BUS_ADDRESS
    export DBUS_SESSION_BUS_PID
  }
fi

#screen -wipe
#if [ -z `ls /var/run/screen/S-rudolf/*.komm` ]
#then
#	#screen -d -m -c ~/.screenrc.komm
#fi

#if [ -z `ls /var/run/screen/S-rudolf/*.term` ]
#then
#	#screen -d -m -S term mc
#fi

#if [[ $SHLVL = 1 ]]; then
if [[ ! $PATH =~ ~/bin ]]; then
  export PATH=~/bin:~/src/opt/bin:$PATH
  export INFOPATH=~/.info:$INFOPATH
fi

export HISTSIZE=10000
export HISTFILE="$HOME/.zshist"
export SAVEHIST=$HISTSIZE
