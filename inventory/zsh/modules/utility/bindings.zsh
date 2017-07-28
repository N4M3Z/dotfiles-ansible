# [esc + space] - run command: cd ..
zle -N dirup
bindkey '\e ' dirup # [esc + space]

# [esc + enter] : print Git/Svn status or list files with ls
zle -N lstatus
bindkey '\e\r' lstatus # [esc + enter]
bindkey '\M\r' lstatus # [alt + enter]
