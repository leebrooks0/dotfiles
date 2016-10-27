#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export TERM=xterm-256color
export EDITOR=nvim

alias v='nvim'
alias f='fg'

alias p='bpython'
alias pi='pip install'
alias pir='pip install -r'
alias f8='flake8 .'
alias t='flake8 . && py.test'

alias dcs='python manage.py createsuperuser'
alias dmm='python manage.py makemigrations'
alias dm='python manage.py migrate'
alias drs='python manage.py runserver'
alias ds='python manage.py shell'

alias gb='git branch'
alias gbd='git branch -D'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias gpl='git pull origin'
alias gplm='git pull origin master'
alias gps='git push origin'
