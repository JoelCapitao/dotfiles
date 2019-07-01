#!/bin/bash

export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="vifm"

[ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
