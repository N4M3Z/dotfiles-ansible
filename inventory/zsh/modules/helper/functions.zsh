# Check whether a command is defined
function is-defined ()
{
    type "$1" &> /dev/null;
}

# Check whether the enviroment is Cygwin
function is-cygwin ()
{
    [[ $('uname') == 'Cygwin' ]]
}

# Check whether the enviroment is Linux
function is-linux ()
{
    [[ $('uname') == 'Linux' ]]
}

# Check whether the enviroment is OS X
function is-osx ()
{
    [[ $('uname') == 'Darwin' ]]
}
