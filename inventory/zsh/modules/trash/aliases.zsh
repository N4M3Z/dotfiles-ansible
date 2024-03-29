##
#  @file
#      trash/aliases.zsh
#
#  @brief
#      Aliases for the *trash* plugin
#      (https://github.com/sindresorhus/trash)
#
#  @authors
#      Martin Zeman <martin.zeman@protonmai.ch>
#
alias t=trash

# Safety first according to: https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
alias rm="nocorrect rm -i"
alias cp="nocorrect cp -i"
alias mv="nocorrect mv -i"

alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

alias del="rm -i"
alias md="mkdir -p"
alias rd="rmdir"
