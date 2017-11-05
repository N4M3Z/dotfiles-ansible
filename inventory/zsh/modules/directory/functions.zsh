# Creates a directory and then changes to it.
function mkdcd
{
    [[ -n "$1" ]] && command mkdir -p "$1" && command cd "$1"
}
