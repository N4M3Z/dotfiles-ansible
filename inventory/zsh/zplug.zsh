zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "sorin-ionescu/prezto"
# zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"

zplug "modules/helper", from:prezto
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto, on:"modules/helper",
zplug "modules/utility", from:prezto, on:"modules/spectrum"
zplug "modules/completion", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/git", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/tmux", from:prezto
# zplug 'modules/prompt', from:prezto

zplug "plugins/composer", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", as:plugin, defer:1
zplug "zsh-users/zsh-history-substring-search", as:plugin, on:"zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, on:"zsh-users/zsh-syntax-highlighting", on:"zsh-users/zsh-history-substring-search", defer:2

zplug "ascii-soup/zsh-url-highlighter", use:url/url-highlighter.zsh, on:"zsh-users/zsh-syntax-highlighting", defer:2

zplug "djui/alias-tips", use:alias-tips.plugin.zsh

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
zstyle -s ":dotzsh:module:alias-tips" text "ZSH_PLUGINS_ALIAS_TIPS_TEXT"

zplug "StackExchange/blackbox", as:plugin

export ENHANCD_FILTER=fzy:fzf:peco
export ENHANCD_COMMAND=cd
export ENHANCD_DOT_SHOW_FULLPATH=1

zplug "b4b4r07/enhancd", as:plugin, use:init.sh, on:"modules/directory", defer:3
zplug "b4b4r07/epoch-cat", as:command, rename-to:ecat

zplug "erichs/composure", use:composure.sh

zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme", as:theme, defer:3

zplug "voronkovich/phpcs.plugin.zsh", as:plugin
zplug "voronkovich/phpunit.plugin.zsh", as:plugin

zplug "~/.zsh/modules/autosuggestions", from:local, on:"zsh-users/zsh-autosuggestions"
zplug "~/.zsh/modules/directory", from:local, on:"modules/directory"
zplug "~/.zsh/modules/helper", from:local, on:"modules/helper"
zplug "~/.zsh/modules/history", from:local, on:"modules/history"
zplug "~/.zsh/modules/history-substring-search", from:local, on:"zsh-users/zsh-history-substring-search", defer:2
zplug "~/.zsh/modules/php", from:local, on:"zsh-users/zsh-history-substring-search"
zplug "~/.zsh/modules/prompt", from:local, on:"bhilburn/powerlevel9k", defer:3
zplug "~/.zsh/modules/utility", from:local, on:"modules/utility"
zplug "~/.zsh/modules/tex", from:local
zplug "~/.zsh/modules/todo-txt", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose
then
    printf "Install? [y/N]: "
    if read -q
    then
        echo; zplug install
    fi
fi
