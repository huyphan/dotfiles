export AUTO_TITLE_SCREENS="NO"

autoload -U colors && colors
export PS1="%{%F{yellow}%}%n%{%f%}@%{%F{green}%}%m%{%F{green}%}(%~)%{$%f%}%  "
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
