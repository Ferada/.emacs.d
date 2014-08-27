#!/bin/zsh

export PATH="~/bin/:~/scripts/:~/src/opt/bin/:$PATH"

export EDITOR=vim
export BROWSER=links
export NNTPSERVER=news.arcor.de
#export NNTPSERVER="news.hansenet.de"
export PS_PERSONALITY=linux

export MPD_HOST=localhost
#export MPD_HOST="straylight"
export MPD_PORT=6600

export BOUML_ID=42
export BOUML_EDITOR="gvim -d"

export LIMPRUNTIME=~/.limp

#export NCURSES_ASSUMED_COLORS="-1,-1"
export XTERMINAL="urxvt-run"

export DWMFIFO=~/.dwmfifo

export FULLNAME="Olof-Joachim Frahm"
export EMAIL="olof@macrolet.net"

# Syntax highlight for less with 'source-highlight'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
export READNULLCMD=less

#export MANPAGER="vimmanpager"
#export PAGER="vimpager"
export PAGER=less

export R_LIBS=~/.R/library/

# Manpath & Manualpage search order
export MANSECT=1:2:3:3p:9:8:5:4:7:6:n

setopt ALWAYS_TO_END NO_BEEP CLOBBER AUTO_CD
setopt CHECK_JOBS NO_HUP
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS

setopt NO_NOTIFY LONG_LIST_JOBS
setopt PUSHD_SILENT RC_QUOTES

setopt NO_MATCH EXTENDED_GLOB

limit -s coredumpsize 0
umask 0027

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload zsh/zutil

# own completions
fpath=(~/.zsh.d/completions $fpath)
