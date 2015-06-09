export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Base16 Shell
 BASE16_SCHEME="eighties"
 BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
 [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# automatically start a tmux session upon logging in.
ZSH_TMUX_AUTOSTART="true"

unsetopt correct_all

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(tmux git github node npm redis-cli vundle gnu-utils history-substring-search)

source $ZSH/oh-my-zsh.sh
autoload zmv

# local stuff
if [ -f ~/.profile.local ]; then
  . ~/.profile.local
fi
# local stuff
if [ -f ~/.profile ]; then
  . ~/.profile
fi

export EDITOR=vim
export LANG=en_US.UTF-8

# Update all env
tmup ()
{
    echo -n "Updating to latest tmux environment...";
    export IFS=",";
    for line in $(tmux showenv -t $(tmux display -p "#S") | tr "\n" ",");
    do
        if [[ $line == -* ]]; then
            unset $(echo $line | cut -c2-);
        else
            export $line;
        fi;
    done;
    unset IFS;
    echo "Done"
}

zstyle :omz:plugins:ssh-agent agent-forwarding on

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

