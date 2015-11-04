# Hide "(venv)prompt>" as fish theme includes venv info
set VIRTUAL_ENV_DISABLE_PROMPT 1

# oh-my-fish
set fish_path $HOME/.oh-my-fish
. $fish_path/oh-my-fish.fish
Theme bobthefish

# pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)

# Use Neovim true colours
set -x NVIM_TUI_ENABLE_TRUE_COLOR 1

# Use Neovim everywhere
set -x EDITOR nvim

# Hide the fish greeting
function fish_greeting
end

# Hide the right prompt
function fish_right_prompt
end

# Load shell aliases
. ~/.config/fish/aliases.fish
