# separator dashes size
function afmagic_dashes {
 [[ -n "${VIRTUAL_ENV-}" && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
  && echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
  || echo $COLUMNS
}

PROMPT='$FG[237]${(l.$(afmagic_dashes)..-.)}%{$reset_color%}%{$fg_bold[green]%}%*'
PROMPT+=' %{$fg_bold[cyan]%}%~%{$reset_color%}$(git_prompt_info) '
RPROMPT='%{$FG[237]%}%m%{$reset_color%}%'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} (%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%})%{$fg_bold[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})"
