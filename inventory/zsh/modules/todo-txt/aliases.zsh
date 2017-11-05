if (( ! $+commands[todo.sh] )); then
    return 1
fi

alias todo='todo.sh'
alias todols='todo -c ls'
alias todoadd='todo -t add'
alias todoto='todo -t addto'
alias todorm='todo del'
alias tododel='todo del'
alias todomv='todo move'
