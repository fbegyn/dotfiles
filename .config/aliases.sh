#!/bin/bash

source ~/.config/git.sh
# Aliases for yay
alias paupg='yay -Syu'
alias pasu='yay -Syu --noconfirm'
alias pain='yay -S'
alias pains='yay -U'
alias pare='yay -R'
alias parem='yay -Rns'
alias parep='yay -Si'
alias pareps='yay -Ss'
alias paloc='yay -Qi'
alias palocs='yay -Qs'
alias palst='yay -Qe'
alias paorph='yay -Qtd'
alias painsd='yay -S --asdeps'
alias pamir='yay -Syy'

# Aliases to make ls better
#alias ls='exa'
#alias ll='exa -l'
#alias la='exa -a'

alias vivado='/opt/Xilinx/Vivado/2018.2/bin/vivado'

# Open another terminal in the same location
alias dup='urxvt &'

# Config foler directory
#alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Launch vivado command line
alias vivado-cli='/opt/Xilinx/Vivado/2017.3/bin/vivado -mode tcl'

# Get mouse unstuck
alias mousefix='sudo modprobe -r psmouse && sudo modprobe psmouse'

# cast video -- maybe add --control behind it
alias video-cast='mkchromecast --video --control -i'

# Fork zathura
alias zathura='zathura --fork -l error'

# wpa_cli to select the correct interface
alias wpa_cli='wpa_cli -i wlp58s0'

# wake server at home
alias wakeAlpha='wol 00:25:22:aa:61:0e'

alias open='xdg-open'

# Raspberry go commands
alias raspgo='env GOOS=linux GOARCH=arm GOARM=5 go'

# Tmux
alias 'tn'='tmux new -s'
alias 'ta'='tmux attach -t'

# Easier to type light then brightnessctl
alias light='brightnessctl'

# vim, but then sudoes
alias svim='sudo -E vim'
alias lvim='vim $LEDG'
alias lfava='fava $LEDG'

alias hackerslides='docker run -it -e USER=francis -e PASSWDORD=slides -p 8080:8080 -v $(pwd)/slides:/app/slides msoedov/hacker-slides'
alias kali='docker run -it kalilinux/kali-linux-docker'
alias influx='docker run -it influxdb bash'

alias pidfind='ps aux | fzf'

alias hoekmusic='ncmpcpp -h 10.0.05 -p 6600'
alias plaympd='pax11publish -e -S'
