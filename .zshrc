# Personal config files for bash
source ~/.config/aliases.sh
source ~/.config/exports.sh
source ~/.config/functions.sh
# Liquidpromt
#source ~/.config/liquidprompt/liquidprompt
#[[ $- = *i*  ]] && source ~/.config/liquidprompt/liquidprompt
# Quick moving around directories
. $HOME/.config/z.sh
. $HOME/.config/zsh/zsh_plugins.sh
. $HOME/.config/zsh/fzf-keybindings.zsh
# Git autocompletions
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# Python virtualenv
source /usr/bin/virtualenvwrapper.sh

# reverse search
bindkey -v
#bindkey '^r' history-incremental-search-backward
# up/down searches the history (only if empty)
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
# Except suggestion
bindkey '^ ' autosuggest-accept

# Ignore /etc/hosts, too many hosts in there
zstyle ':completion:*' hosts off

# History settings
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.
# History Variables
HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"  # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000                   # The maximum number of events to save in the history file.

# Dir options
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
