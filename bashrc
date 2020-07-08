export CLICOLOR=1
export PS1='\[\033[01;36m\]\W$(__git_ps1)\[\033[32m\] ▲\[\033[00m\] '
export LSCOLORS="gxcxBxDxexxxxxaBxBhghGh"
export EDITOR="/usr/local/bin/nvim"
export BREWEDITOR=$EDITOR
export CC="/usr/local/bin/gcc-10"
export CXX="/usr/local/bin/g++-10"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"
export GPG_TTY=$(tty)

source ~/.bash_aliases
source ~/.bash_completion
source ~/.bash_functions
