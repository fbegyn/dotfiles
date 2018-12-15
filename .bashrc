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
# Git completions
. ~/.config/git-completions.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
