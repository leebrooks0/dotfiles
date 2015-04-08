# Hide "(venv)prompt>" as fish theme includes venv info
set VIRTUAL_ENV_DISABLE_PROMPT 1

# oh-my-fish
set fish_path $HOME/.oh-my-fish
set fish_theme bobthefish
set fish_plugins extract python
. $fish_path/oh-my-fish.fish

# Use 256 colours
set -x TERM xterm-256color

# pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)

# Use Vim everywhere
set -x EDITOR vim

# Hide the fish greeting
function fish_greeting
end

# Hide the right prompt
function fish_right_prompt
end
