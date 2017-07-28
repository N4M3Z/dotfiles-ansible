zplug "zplug/zplug", \
    hook-build:'zplug --self-manage'

zplug "modules/helper", \
    from:prezto

zplug "modules/terminal", \
    from:prezto

zplug "modules/editor", \
    from:prezto

zplug "modules/history", \
    from:prezto

zplug "modules/directory", \
    from:prezto

zplug "modules/spectrum", \
    from:prezto

zplug "modules/utility", \
    from:prezto

zplug "modules/completion", \
    from:prezto

# zplug "modules/tmux", \
#     from:prezto

zplug "zsh-users/zsh-syntax-highlighting", \
    as:plugin, \
    defer:2

zplug "ascii-soup/zsh-url-highlighter", \
    use:url/url-highlighter.zsh, \
    on:"zsh-users/zsh-syntax-highlighting", \
    defer:2

zplug "zsh-users/zsh-history-substring-search", \
    as:plugin, \
    on:"zsh-users/zsh-syntax-highlighting", \
    defer:3

zplug "zsh-users/zsh-autosuggestions", \
    use:zsh-autosuggestions.zsh, \
    on:"zsh-users/zsh-syntax-highlighting", \
    on:"zsh-users/zsh-history-substring-search", \
    defer:3

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

zplug "djui/alias-tips", \
    use:alias-tips.plugin.zsh

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "

zplug "StackExchange/blackbox", \
    as:plugin

export GPGKEY="$(gpg -K | awk 'NR==3 {print $2}' | sed 's/4096R\///g')"

zplug "erichs/composure", \
    use:composure.sh

zplug "bhilburn/powerlevel9k", \
    use:"powerlevel9k.zsh-theme", \
    as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
