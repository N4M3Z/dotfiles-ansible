zstyle -s ':dotzsh:module:history-substring-search:color' found \
  'HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND' \
    || HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'

zstyle -s ':dotzsh:module:history-substring-search:color' not-found \
  'HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND' \
    || HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

zstyle -s ':dotzsh:module:history-substring-search' globbing-flags \
  'HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS' \
    || HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

if zstyle -t ':dotzsh:module:history-substring-search' case-sensitive; then
    HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="${HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS//i}"
fi

if ! zstyle -t ':dotzsh:module:history-substring-search' color; then
    unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_{FOUND,NOT_FOUND}
fi
