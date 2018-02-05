zplug "zplug/zplug", hook-build:"zplug --self-manage"

# zplug "sorin-ionescu/prezto"
# zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"

zplug "modules/helper", from:prezto, as:plugin
zplug "modules/environment", from:prezto, as:plugin
zplug "modules/terminal", from:prezto, as:plugin
zplug "modules/editor", from:prezto, as:plugin
zplug "modules/history", from:prezto, as:plugin
zplug "modules/directory", from:prezto, as:plugin
zplug "modules/spectrum", from:prezto, as:plugin
zplug "modules/utility", from:prezto, as:plugin
zplug "modules/completion", from:prezto, as:plugin
zplug "modules/homebrew", from:prezto, as:plugin
zplug "modules/git", from:prezto, as:plugin
zplug "modules/osx", from:prezto, as:plugin
zplug "modules/tmux", from:prezto, as:plugin
# zplug "modules/python", from:prezto, on:"powerline/powerline", defer:3

zplug "plugins/composer", from:oh-my-zsh
zplug "w00fz/142b6b19750ea6979137b963df959d11", from:gist, as:command, rename-to:"sphp", use:"sphp.sh"

zplug "zsh-users/zsh-syntax-highlighting", as:plugin, defer:1
zplug "zsh-users/zsh-history-substring-search", as:plugin, on:"zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, use:zsh-autosuggestions.zsh, on:"zsh-users/zsh-syntax-highlighting", on:"zsh-users/zsh-history-substring-search", defer:2

zplug "ascii-soup/zsh-url-highlighter", as:plugin, use:url/url-highlighter.zsh, on:"zsh-users/zsh-syntax-highlighting", defer:2

zplug "djui/alias-tips", as:plugin, use:"alias-tips.plugin.zsh"

zplug "StackExchange/blackbox", as:command

zplug "b4b4r07/enhancd", as:plugin, use:init.sh, on:"modules/directory", defer:3

# zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme", as:theme, defer:3
zplug "powerline/powerline", as:plugin, use:"powerline/bindings/zsh/powerline.zsh", on:"modules/environment", defer:1
# run powerline-daemon -q if powerline is slow

zplug "~/.zsh/modules/alias-tips", as:plugin, from:local, on:"djui/alias-tips"
zplug "~/.zsh/modules/autosuggestions", as:plugin, from:local, on:"zsh-users/zsh-autosuggestions", defer:2
zplug "~/.zsh/modules/dircycle", as:plugin, from:local, on:"modules/directory", lazy:true
zplug "~/.zsh/modules/directory", as:plugin, from:local, on:"modules/directory"
zplug "~/.zsh/modules/enhancd", as:plugin, from:local, on:"modules/directory"
zplug "~/.zsh/modules/environment", as:plugin, from:local, on:"modules/environment"
zplug "~/.zsh/modules/helper", as:plugin, from:local, on:"modules/helper"
zplug "~/.zsh/modules/history", as:plugin, from:local, on:"modules/history"
zplug "~/.zsh/modules/history-substring-search", as:plugin, from:local, on:"zsh-users/zsh-history-substring-search", defer:2
zplug "~/.zsh/modules/php", as:plugin, from:local, on:"zsh-users/zsh-history-substring-search"
# zplug "~/.zsh/modules/prompt", as:plugin, from:local, on:"bhilburn/powerlevel9k", defer:3
zplug "~/.zsh/modules/python", as:plugin, from:local, defer:3
zplug "~/.zsh/modules/tex", as:plugin, from:local
zplug "~/.zsh/modules/todo-txt", as:plugin, from:local
zplug "~/.zsh/modules/utility", as:plugin, from:local, on:"modules/utility"
zplug "~/.zsh/modules/wordchar", as:plugin, from:local

zplug "erichs/composure", as:plugin, use:"composure.sh", lazy:true
zplug "b4b4r07/epoch-cat", as:command, rename-to:"ecat", lazy:true

zplug "voronkovich/phpcs.plugin.zsh", as:plugin, lazy:true
zplug "voronkovich/phpunit.plugin.zsh", as:plugin, lazy:true
