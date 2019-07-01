#!/bin/sh

[ -f $HOME/.Xresources ] && xrdb -merge ~/.Xresources
[ -f $HOME/.xprofile  ] && . ~/.xprofile

exec i3
