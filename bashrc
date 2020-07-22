rvm_prompt () { local prompt=$(~/.rvm/bin/rvm-prompt);  [[ -n $prompt && 1 -eq $USE_RVM_PROMPT ]] && printf " ${prompt}"; }

CC="/usr/local/bin/gcc-10"
CLICOLOR=1
CXX="/usr/local/bin/g++-10"
EDITOR="/usr/local/bin/nvim"
GPG_TTY=$(tty)
LSCOLORS="gxcxBxDxexxxxxaBxBhghGh"
PATH="$PATH:$HOME/.rvm/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"
PS1='\[\033[01;36m\]\W\[\033[33m\]$(__git_ps1)\[\033[31m\]$(rvm_prompt)\[\033[32m\] ▲\[\033[00m\] '
USE_RVM_PROMPT=0

export CC CLICOLOR CXX EDITOR GPG_TTY LSCOLORS PATH PS1 USE_RVM_PROMPT

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_completion

neofetch
