##
# File loader
# @brief Sources files.
#
function dotzsh-file-load()
{
    file=$1
    if [[ -s $file ]]
    then
        source $file
    fi
}

##
# Function loader
# @brief Loads dotzsh functions.
#
function dotzsh-function-load()
{
    # $argv is overridden in the anonymous function.
    paths=("$argv[@]")

    local pfunction

    # Extended globbing is needed for listing autoloadable function directories.
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    # Load dotzsh functions.

    for pfunction in ${^paths}/${~pfunction_glob}; do
        autoload -Uz "$pfunction"
    done
}

# Add functions to $fpath.
fpath=(${ZSH}/functions(/FN) $fpath)

# Autoload functions.
dotzsh-function-load ${ZSH}/functions/

##
# Module Loader
# @brief Loads dotzsh modules.
#
function dotzsh-module-load()
{
    local -a dzmodules
    local dzmodule
    local dzmodload_start
    local dzmodload_stop
    local dzmodload_elapsed
    local dzmodload_module_start
    local dzmodload_module_stop
    local dzmodload_module_elapsed
    local dzmodload_module_elapsed_total=0
    local type

    if zstyle -t ":dotzsh:load" timing && (( $+commands[gdate] )); then
        dzmodload_start=$(gdate +'%s%N')
    else
        dzmodload_start=0
    fi

    # $argv is overridden in the anonymous function.
    dzmodules=("$argv[@]")

    # Add functions to $fpath.
    fpath=(${dzmodules:+${ZSH}/modules/${^dzmodules}/functions(/FN)} $fpath)

    # Load dotzsh modules.
    for dzmodule in "$dzmodules[@]"; do
        if zstyle -t ":dotzsh:module:${dzmodule}" timing && (( $+commands[gdate] ))
        then
            dzmodload_module_start=$(gdate +'%s%N')
        fi

        if zstyle -t ":dotzsh:module:$dzmodule" loaded 'yes' 'no'
        then
            continue
    elif [[ ! -d "${ZSH}/modules/$dzmodule" ]]
        then
            print "$0: no such module: $dzmodule" >&2
            continue
        else
            # Autoload functions.
            dotzsh-function-load ${ZSH}/modules/${dzmodule}/functions/

            # Load module initialization script
            dotzsh-file-load "${ZSH}/modules/$dzmodule/config.zsh"
            dotzsh-file-load "${ZSH}/modules/$dzmodule/functions.zsh"
            dotzsh-file-load "${ZSH}/modules/$dzmodule/aliases.zsh"
            dotzsh-file-load "${ZSH}/modules/$dzmodule/bindings.zsh"

            if (( $? == 0 ))
            then
                zstyle ":dotzsh:module:$dzmodule" loaded 'yes'
            else
                # Remove the $fpath entry.
                dotzsh-function-unset ${dzmodule}
                zstyle ":dotzsh:module:$dzmodule" loaded 'no'
            fi

            if zstyle -t ":dotzsh:module:${dzmodule}" timing && (( $+commands[gdate] ))
            then
                let dzmodload_module_stop=$(gdate +'%s%N')
                (( dzmodload_module_elapsed = $dzmodload_module_stop - $dzmodload_module_start ))
                (( dzmodload_module_elapsed_total = $dzmodload_module_elapsed_total + $dzmodload_module_elapsed ))
            else
                dzmodload_module_elapsed=0
            fi

            zstyle ":dotzsh:module:${dzmodule}" elapsed ${dzmodload_module_elapsed}
            unset dzmodload_module_{start,stop,elapsed}
        fi
    done

    if zstyle -t ":dotzsh:load" timing && (( $+commands[gdate] ))
    then
        let dzmodload_stop=$(gdate +'%s%N')
        (( dzmodload_elapsed=$dzmodload_stop-$dzmodload_start ))
        zstyle ":dotzsh:module" elapsed ${dzmodload_module_elapsed_total}
    fi
    zstyle ":dotzsh:load" elapsed ${dzmodload_elapsed}

    unset dzmodule{s,} dzmodload_{module_,}{start,stop,elapsed}
}

##
# Simple caching
# @brief Build simple cache from all modules to speed up loading
#
function dotzsh-module-cache()
{
    plugins=(
        alias-tips
        dircycle
        directory
        enhancd
        environment
        helper
        history
        php
        tex
        todo-txt
        utility
        wordchar
        autosuggestions
        history-substring-search
        python
    )

    if [[ ! -f ${ZDOTDIR:-${HOME}}/.zsh/modules/cache.zsh ]]
        cat ${ZDOTDIR:-${HOME}}/.zsh/modules/${^plugins}/*.zsh > ${ZDOTDIR:-${HOME}}/.zsh/modules/cache.zsh
    fi
}
