# NO_PUSHD_MINUS syntax:
#   pushd +N: start counting from left of `dirs' output
#   pushd -N: start counting from right of `dirs' output

insert-cycledleft ()
{
    emulate -L zsh
    setopt NO_PUSHD_MINUS

    builtin pushd -q +1 &>/dev/null || true
    zle reset-prompt
}

insert-cycledright ()
{
    emulate -L zsh
    setopt NO_PUSHD_MINUS

    builtin pushd -q -0 &>/dev/null || true
    zle reset-prompt
}
