#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run compton
run qutebrowser
run redshift
run udiskie -2At
#run rambox
run thunderbird
run mpd ~/.config/mpd/mpd.conf
