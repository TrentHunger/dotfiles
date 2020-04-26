if [[ $(uname -s) == Darwin ]]
then
    if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
        . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
    fi

    if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
        source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
    fi
else
    source ~/.git-prompt.sh
fi

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

export PROMPT_COMMAND='__git_ps1 "\[\e[01;34m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]:\[\e[36m\]\W\[\e[0m\]" "\\$ ";'
export CLICOLOR=1
export GPG_TTY=$(tty)
