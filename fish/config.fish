# Hide "(venv)prompt>" as fish theme includes venv info
set VIRTUAL_ENV_DISABLE_PROMPT 1

# oh-my-fish
set fish_path $HOME/.oh-my-fish
set fish_theme bobthefish
set fish_plugins extract python
. $fish_path/oh-my-fish.fish

# Use 256 colours AND play nicely with Tmux
set -x TERM screen-256color

# pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)

# Use Vim everywhere
set -x EDITOR vim

# Hide the fish greeting
function fish_greeting
end

# Show a more useful right prompt
function fish_right_prompt
  set_color $fish_color_autosuggestion[1]
  set __python_version (python -V | cut -c1-)
  set __ruby_version Ruby (ruby -e "print RUBY_VERSION")
  echo "$__python_version; $__ruby_version"
end
