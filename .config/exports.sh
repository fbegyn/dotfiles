#!/bin/bash
# set some system default
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export PAGER='/usr/bin/less'
export BROWSER='/usr/bin/qutebrowser'
export TERMINAL='/usr/bin/alacritty'
export XIVIEWER=feh

# Pandoc template home
export TEXINPUTS=~/.pandoc/templates:$TEXINPUTS

export WINIT_HIDPI_FACTOR=1.0

# home for python virtualenvs
export WORKON_HOME=~/.virtualenvs

export XDG_CURRENT_DESKTOP=Unity

# Faster zsh vi mode
export KEYTIMEOUT=2

# vimrc file
export MYVIMRC='/home/francis/.vimrc'

# set GOPATH and GOROOT
export GOPATH='/home/francis/Go'
export LGOPATH='/home/francis/lgo'

# Tensorflow
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Add GOPATH to the PATH
export PATH="/usr/bin:/usr/bin/vendor_perl:/usr/bin/perl:/usr/bin/core_perl:$GOPATH/bin:/home/francis/Scripts:/opt/android-sdk/platform-tools"

# Current academy year folder
export UGENT='/home/francis/Documents/Ugent/2018-2019'

# PATH expansions
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/Scripts:$PATH"

export ANSIBLE_ROLES_PATH="/home/francis/Documents/Projects/FoM/ansible:/home/francis/Documents/Projects/FoM/ansible-lanparty"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Things for debian packages
export DEBFULLNAME='Francis Begyn'
export DEBEMAIL='francis.begyn@gmail.com'

# Ledger files
export LEDGER_FILE=/home/francis/Documents/Finances/Ledger/2019.journal

# Tmux sessions home
export TMUXP_HOME=/home/francis/.config/tmuxp
