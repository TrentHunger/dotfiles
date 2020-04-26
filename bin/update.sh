#!/usr/bin/env bash

uname=`uname -s`

if [[ $uname == Darwin ]]; then
   vim +PlugUpgrade +PlugUpdate +qa
elif [[ $uname == FreeBSD ]]; then
   freebsd-update fetch install
   pkg update
   pkg upgrade
   pkg autoremove
elif [[ $uname == Linux ]]; then
   echo Linux
else
   echo $uname
fi
