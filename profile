export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# set some nice PS
export PS1='\[\e[1;31m\][\T]\[\e[1;35m\][\u]\e[1;32m\][\w]\[\e[0m\]★  '
export PS2="\[$(tput bold)$(tput setb 4)$(tput setaf 9)\]continue-\$ \[$(tput sgr0)\]"

# local stuff
if [ -f ~/.profile.local ]; then
  . ~/.profile.local
fi

# set vim as the default editor
export EDITOR=vim

# To prevent loggin out with Ctrl+d:
export IGNOREEOF=2

# enable 256 color mode                                                                                                                                                              
export TERM=xterm-256color

# ls colors that look less discusting with solarized
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
