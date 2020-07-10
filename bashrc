export CLICOLOR=1
export USE_RVM_PROMPT=1
rvm_prompt () { local prompt=$(~/.rvm/bin/rvm-prompt);  [[ -n $prompt && 1 -eq $USE_RVM_PROMPT ]] && printf " ${prompt}"; }
export PS1='\[\033[01;36m\]\W\[\033[33m\]$(__git_ps1)\[\033[31m\]$(rvm_prompt)\[\033[32m\] ▲\[\033[00m\] '
export LSCOLORS="gxcxBxDxexxxxxaBxBhghGh"
export EDITOR="/usr/local/bin/nvim"
export BREWEDITOR=$EDITOR
export CC="/usr/local/bin/gcc-10"
export CXX="/usr/local/bin/g++-10"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export GPG_TTY=$(tty)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_completion

