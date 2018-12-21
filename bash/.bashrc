# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Use another file for aliases
##if [ -f ~/.bash_aliases ]; then
##. ~/.bash_aliases
##fi

# Aliases
alias ll='ls -la'
