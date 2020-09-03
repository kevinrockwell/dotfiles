alias v="nvim"
alias f="echo rip in pieces"
alias brewup='brew update && brew upgrade; brew cleanup; brew doctor'
alias ls='ls --color=auto'
alias primefact='/Users/kevinrockwell/Documents/random_crap/prime_fact'
alias openxkcd='python -m webbrowser -t "https://c.xkcd.com/random/comic"'
alias eject='diskutil eject'
alias starwars="telnet towel.blinkenlights.nl"
alias random="python3 -c 'import random; print(random.random())'"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias countryroads="cd ~"
alias pusho='git push origin $(git symbolic-ref --short HEAD)'
alias pullo='git pull origin $(git symbolic-ref --short HEAD)'
alias pullm='git pull upstream master'
alias gcc='gcc-10'
alias urb='export USE_RVM_PROMPT=$((1-$USE_RVM_PROMPT))'
alias fv='nvim $(fzf)'
alias be='bundle exec'
eval $(thefuck --alias)
