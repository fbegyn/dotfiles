# Personal config files for bash
source ~/.config/aliases.sh
source ~/.config/exports.sh
source ~/.config/functions.sh
# Liquidpromt
source ~/.config/liquidprompt/liquidprompt
[[ $- = *i*  ]] && source ~/.config/liquidprompt/liquidprompt
# Quick moving around directories
. /home/francis/.config/z.sh
# Plugin loading
. /home/francis/.config/zsh/zsh_plugins.sh
# Git autocompletions
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward
# up/down searches the history (only if empty)
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Except suggestion
bindkey '^ ' autosuggest-accept
