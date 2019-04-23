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
#run dunst
#run /usr/bin/i3lock -c 000000
run Rambox
run Thunderbird
