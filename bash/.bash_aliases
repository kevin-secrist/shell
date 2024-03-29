# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias exa='exa --long --grid'
alias exl='exa --long --header --git --all'

alias subl='"/mnt/c/Program Files/Sublime Text 3/sublime_text.exe"'
alias urlencode='python3 -c "from urllib.parse import quote, sys; print(quote(  sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
alias urldecode='python3 -c "from urllib.parse import unquote, sys; print(unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
alias datestring='date +%Y%m%d%H%M%S'
alias nodetls='export NODE_TLS_REJECT_UNAUTHORIZED=0'
alias dive='docker run --rm -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e DOCKER_API_VERSION=1.37 \
    wagoodman/dive:latest'
if grep -q -i microsoft /proc/version; then
  alias copy="clip.exe"
  alias paste="powershell.exe Get-Clipboard"
fi
