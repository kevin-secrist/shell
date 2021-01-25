alias subl='"/mnt/c/Program Files/Sublime Text 3/sublime_text.exe"'
alias urlencode='python3 -c "from urllib.parse import quote, sys; print(quote(  sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
alias urldecode='python3 -c "from urllib.parse import unquote, sys; print(unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
