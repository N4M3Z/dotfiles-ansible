zplug "zplug/zplug", \
    hook-build:'zplug --self-manage'

zplug "sorin-ionescu/prezto", \
    use:"init.zsh", \
    as:plugin

zplug "modules/helper", \
    on:"sorin-ionescu/prezto", \
    from:prezto, \
    hook-load:"dotzsh-module-load helper"

zplug "modules/spectrum", \
    on:"modules/helper", \
    from:prezto

zplug "modules/utility", \
    on:"modules/spectrum", \
    from:prezto, \
    hook-load:"dotzsh-module-load utility"

zplug "modules/terminal", \
    on:"sorin-ionescu/prezto", \
    from:prezto

zplug "modules/editor", \
    on:"sorin-ionescu/prezto", \
    from:prezto

zplug "modules/history", \
    on:"sorin-ionescu/prezto", \
    from:prezto

zplug "modules/directory", \
    on:"sorin-ionescu/prezto", \
    from:prezto


zplug "modules/completion", \
    on:"sorin-ionescu/prezto", \
    from:prezto

zplug "modules/fasd", \
    on:"sorin-ionescu/prezto", \
    from:prezto

# zplug "modules/tmux", \
#     from:prezto

zplug "zsh-users/zsh-syntax-highlighting", \
    as:plugin, \
    defer:2

zplug "ascii-soup/zsh-url-highlighter", \
    use:url/url-highlighter.zsh, \
    on:"zsh-users/zsh-syntax-highlighting", \
    defer:3

zplug "zsh-users/zsh-history-substring-search", \
    as:plugin, \
    on:"zsh-users/zsh-syntax-highlighting", \
    defer:3, \
    hook-load:"dotzsh-module-load history-substring-search"

zplug "zsh-users/zsh-autosuggestions", \
    use:zsh-autosuggestions.zsh, \
    on:"zsh-users/zsh-syntax-highlighting", \
    on:"zsh-users/zsh-history-substring-search", \
    defer:3, \
    hook-load:"dotzsh-module-load autosuggestions"

zplug "djui/alias-tips", \
    use:alias-tips.plugin.zsh

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
zstyle -s ":dotzsh:module:alias-tips" text "ZSH_PLUGINS_ALIAS_TIPS_TEXT"


zplug "StackExchange/blackbox", \
    as:plugin

export GPGKEY="$(gpg -K | awk 'NR==3 {print $2}' | sed 's/4096R\///g')"

export ENHANCD_FILTER=fzy:fzf:peco
export ENHANCD_COMMAND=cd
export ENHANCD_DOT_SHOW_FULLPATH=1

zplug "b4b4r07/enhancd", \
    as:plugin, \
    use:init.sh, \
    on:"modules/directory"

zplug "erichs/composure", \
    use:composure.sh

zplug "bhilburn/powerlevel9k", \
    use:"powerlevel9k.zsh-theme", \
    as:theme, \
    hook-load: "dotzsh-module-load prompt"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose
then
    printf "Install? [y/N]: "
    if read -q
    then
        echo; zplug install
    fi
fi
