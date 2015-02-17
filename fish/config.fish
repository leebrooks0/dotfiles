# Remove the fish greeting
set fish_greeting

# Use 256 colours
set -x TERM xterm-256color

# pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)

# Use Vim by default
set EDITOR vim
