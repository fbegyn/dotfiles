# Personal config files for bash
. ~/.config/aliases.sh
. ~/.config/exports.sh
. ~/.config/functions.sh

# Liquidpromt
#. ~/.config/liquidprompt/liquidprompt
[[ $- = *i*  ]] && . ~/.config/liquidprompt/liquidprompt
# Quick moving around directories
#. /home/francis/.config/z.sh
# fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Python virtualenv
#. /usr/bin/virtualenvwrapper.sh

source /home/francis/.config/broot/launcher/bash/br

complete -C /home/francis/Go/bin/tk tk
