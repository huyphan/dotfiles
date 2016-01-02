export AUTO_TITLE_SCREENS="NO"

export PROMPT="
%{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
%{$fg[cyan]%}hphan-cloud %#%{$fg[default]%} "

export RPROMPT=

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
