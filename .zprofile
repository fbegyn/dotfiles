if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

## start ssh-agent
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#  ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#  eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
#fi

eval $(keychain --eval --nogui --agents ssh,gpg --timeout 360  --quiet id_ed25519 personal_francis)

# end start ssh agent

export PATH="$HOME/.cargo/bin:$PATH"
