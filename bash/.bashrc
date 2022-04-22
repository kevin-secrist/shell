# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion fecheatures (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# reference the bin directory for scripts
_REPO_LOCATION=$(dirname $(realpath $BASH_SOURCE))
_REPO_BIN="$_REPO_LOCATION/bin"
_GITSCRIPTS_LOCATION=$(realpath "$_REPO_LOCATION/../git-scripts")

# PATH updates
export PATH=$PATH:$HOME/.local/bin:$_REPO_BIN:$_GITSCRIPTS_LOCATION

# go get -u github.com/justjanne/powerline-go
GOPATH=$HOME/go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $? -modules time,venv,user,ssh,cwd,perms,git,aws,hg,jobs,exit,root -static-prompt-indicator -newline)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# start the ssh-agent, any ssh-keys should be added in .bash_local
#eval $(ssh-agent -s) > /dev/null

# start gpg-agent
#gpg-agent --daemon --enable-ssh-support
export GPG_TTY=$(tty)

# set up x11 forwarding (only required on WSL)
# requires an x11 server installed on windows
# e.g. running VcXsrv: "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl
# be sure to allow VcXsrv access to public networks on firewall
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0

if [ `command -v wslpath` ]; then
  DESKTOP=`powershell.exe '[Environment]::GetFolderPath("Desktop")' | tr -d '\r'`
  export DESKTOP=`wslpath "$DESKTOP"`
fi

# apt install direnv
eval "$(direnv hook bash)"

# any machine-specific bash scripts here
# things that may be in bash_local:
#   # sudo apt install keychain
#   /usr/bin/keychain --nogui $HOME/.ssh/ssh_key_here
#   source $HOME/.keychain/$HOSTNAME-sh
#
#   # npm completion >> ~/.bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# from https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bind ctrl+backspace
bind '"\C-H":backward-kill-word'
# bind esc to clear line
bind '"\e":kill-whole-line'

export VISUAL=vim
export EDITOR="$VISUAL"

cd ~/Code
