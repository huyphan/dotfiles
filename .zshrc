export AUTO_TITLE_SCREENS="NO"
setopt prompt_subst

autoload -U colors && colors

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

bindkey -v
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^[3;5~" delete-char
bindkey "^[[1~"   beginning-of-line
bindkey "^[[4~"   end-of-line
bindkey "\e[3~"   delete-char
bindkey "^R"      history-incremental-search-backward

LSCOLORS="gxGxFxDxCxDxDxhbhdacEc";

# Do we need Linux or BSD Style?
if ls --color -d . &>/dev/null 2>&1
then
  # Linux Style
  export LS_COLORS=$LS_COLORS
  alias ls='ls --color=tty'
else
  # BSD Style
  export LSCOLORS=$LSCOLORS
  alias ls='ls -G'
fi

# Use same colors for autocompletion
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

collapse_pwd() {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

virtualenv_prompt_info() {
    [ $VIRTUAL_ENV ] && echo "($(basename $VIRTUAL_ENV)) "
}

prompt () {
    PROMPT="%{$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}% %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
$ "
}

precmd_functions+=(prompt)


alias tmux='export TERM=screen-256color; tmux -2'
# Enable TMUX if not enabled
if [ "$TMUX" = "" ]; then tmux; fi

