function dotzsh-history-edit()
{
    ${EDITOR} ${HISTFILE}
}

# Lists 20 most used commands.
function dotzsh-history-stats()
{
    fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}
