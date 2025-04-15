############### hisotry ##################
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 履歴を複数の端末で共有する
setopt share_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# 重複するコマンドは古い法を削除する
setopt hist_ignore_all_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
############### shell ##################
# git-completion
if [ -f ~/.zsh/git-completion.bash ]; then
    fpath=(~/.zsh $fpath)
    zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
    autoload -Uz compinit && compinit
fi
# git-prompt.sh 
if [ -f ~/.zsh/git-prompt.sh ]; then
    source ~/.zsh/git-prompt.sh
    # addされていない変更を「*」commitされていない変更を「+」で示す
    GIT_PS1_SHOWDIRTYSTATE=true
    # addされていない新規ファイルの存在を「%」で示す
    GIT_PS1_SHOWUNTRACKEDFILES=true
    # stashがある場合は「$」で示す
    unset GIT_PS1_SHOWSTASHSTATE
    # upstreamと同期「=」進んでいる「>」遅れている「<」で示す
    GIT_PS1_SHOWUPSTREAM=auto
fi
setopt PROMPT_SUBST
# 動作が遅いので削除
# function git_color() {
#   local git_info="$(__git_ps1 "%s")"
#   if [[ $git_info == *"%"* ]] || [[ $git_info == *"*"* ]]; then
#     echo '%F{red}'
#   elif [[ $git_info == *"+"* ]] || [[ $git_info == *">"* ]]; then
#     echo '%F{yellow}'
#   else
#     echo '%F{green}'
#   fi
# }
PROMPT_NEW_LINE=$'\n'
# PS1='%F{blue}%n%f %F{green}%~$(git_color)$(__git_ps1 "\n(%s)")${PROMPT_NEW_LINE}%f$ '
PS1='%F{blue}%n%f %F{green}%~%F{yellow}$(__git_ps1 "\n(%s)")${PROMPT_NEW_LINE}%f$ '
# ls change color
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls="ls -G" 
############### openjdk ################
# java home
# export JAVA_HOME=`/usr/libexec/java_home -v 11`
# export PATH=$JAVA_HOME/bin:$PATH
############### python ################
# pyenvを使ってMacにPythonの環境を構築する
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
############### js ################
# node.js
export PATH="$HOME/.nodebrew/current/bin:$PATH"
############### perl ################
# plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init - zsh)"
