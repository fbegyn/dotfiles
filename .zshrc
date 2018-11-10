# Personal config files for bash
source ~/.config/aliases.sh
source ~/.config/exports.sh
source ~/.config/functions.sh
# Liquidpromt
source ~/.config/liquidprompt/liquidprompt
[[ $- = *i*  ]] && source ~/.config/liquidprompt/liquidprompt
# Quick moving around directories
. /home/francis/.config/z.sh
# Syntax highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Git autocompletions
autoload -Uz compinit && compinit
