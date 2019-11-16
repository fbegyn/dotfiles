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

alias rm='rm -I'
alias mv='mv -I'

# Aliases to make ls better
#alias ls='exa'
#alias ll='exa -l'
#alias la='exa -a'

alias weechat='ssh droplet'

alias vim='nvim'
alias vi='nvim'

# Launch vivado command line
alias vivado-cli='/opt/Xilinx/Vivado/2017.3/bin/vivado -mode tcl'

# Fork zathura
alias zathura='zathura --fork -l error'

# wpa_cli to select the correct interface
alias wpa_cli='wpa_cli -i wlp58s0'

# Raspberry go commands
alias raspgo='env GOOS=linux GOARCH=arm GOARM=5 go'

# Tmux
alias 'tn'='tmux new -s'
alias 'ta'='tmux attach -t'

# vim, but then sudoes
alias svim='sudo -E nvim'

alias influx='docker run -it influxdb bash'

alias pidfind='ps aux | fzf'

alias hoekmusic='ncmpcpp -h 10.0.0.5 -p 6600'
alias remotesound='pax11publish -e -S'
alias localsound='pax11publish -e -r'

alias skocheck='onedrive --synchronize --sync-shared-folders --verbose --dry-run'
alias skosync='onedrive --synchronize --sync-shared-folders'
alias skodownload='onedrive --synchronize --sync-shared-folders --download-only'
alias skoupload='onedrive --synchronize --sync-shared-folders --upload-only'

# Thesis things
alias thesis='tmuxp load $TMUXP_HOME/thesis.yaml'

__bcc() {
    clang -fno-stack-protector -g -O2 -emit-llvm -c $1 -o - | \
        llc -march=bpf -filetype=obj -o "`basename $1 .c`.o"
}
alias bcc=__bcc
