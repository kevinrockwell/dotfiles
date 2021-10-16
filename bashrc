# Basic Config
CLICOLOR=1
EDITOR="/usr/local/bin/nvim"
LSCOLORS="gxcxBxDxexxxxxaBxBhghGh"
NVM_DIR="$HOME/.nvm"
export CLICOLOR EDITOR LSCOLORS NVM_DIR

# Bash Settings
HISTCONTROL=erasedups
HISTFILESIZE=
HISTSIZE=
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL HISTFILESIZE HISTSIZE PROMPT_COMMAND

# Make pinentry work for unlocking GPG keys
export GPG_TTY=$(tty)

# Make PATH
PATH="$PATH:$HOME/.rvm/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Use coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"
# Updated llvm, including clangd
PATH="/usr/local/opt/llvm/bin:$PATH"
# Python packages installed with --user
PATH=$PATH:$HOME/Library/Python/3.9/bin/

export PATH

# Custom Prompt
rvm_prompt () {
    local prompt=$(~/.rvm/bin/rvm-prompt)
    [[ -n $prompt && 1 -eq $USE_RVM_PROMPT ]] && printf " ${prompt}"
}
USE_RVM_PROMPT=0
PS1='\[\033[01;36m\]\W\[\033[33m\]$(__git_ps1)\[\033[31m\]$(rvm_prompt)\[\033[32m\] ▲\[\033[00m\] '
export PS1 USE_RVM_PROMPT

# Load language version management
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_completion

neofetch
