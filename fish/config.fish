# oh-my-fish
set fish_path $HOME/.oh-my-fish
set fish_theme bobthefish
set fish_plugins extract python z
. $fish_path/oh-my-fish.fish

# Use 256 colours
set -x TERM xterm-256color

# pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)

# Use Vim by default
set EDITOR vim
