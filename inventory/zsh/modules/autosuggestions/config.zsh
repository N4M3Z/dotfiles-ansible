# Set highlight color, default 'fg=8'.
zstyle -s ':dotzsh:module:autosuggestions:color' found \
    'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Disable highlighting.
if ! zstyle -t ':dotzsh:module:autosuggestions' color; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi
