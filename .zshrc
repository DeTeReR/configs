if [ -z "$TMUX" ]; then
    exec tmux
fi
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstal

# Added from https://www.codementor.io/linux/tutorial/configure-linux-toolset-zsh-tmux-vim
ZSH_THEME="3den"
# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

###

autoload -U promptinit
promptinit

prompt adam1

bindkey '^H' backward-kill-word

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vim
export VISUAL=$EDITOR
export USE_EDITOR=$EDITOR

alias hist='history 1'

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


bindkey "^[[D" backward-word
bindkey "^[[C" forward-word
bindkey '^R' history-incremental-pattern-search-backward

if [ -f ~/.local_stuff ]; then
    . ~/.local_stuff
fi

setxkbmap -option caps:escape
setxkbmap gb
