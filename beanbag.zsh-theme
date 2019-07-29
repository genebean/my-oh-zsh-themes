#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

PROMPT_SUCCESS_COLOR=$FG[006]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[002]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]

P1_ARROW='%{$PROMPT_PROMPT%}╔'
P1_ICON=' ☕️ '
P1_BASE='%{$reset_color%} %{$PROMPT_SUCCESS_COLOR%}%m:%{$reset_color%}%{$fg[yellow]%}%~'
P1_GITINFO='%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$reset_color%}%{$GIT_DIRTY_COLOR%}$(git_remote_status)%{$reset_color%} $(git_prompt_status)'
P1_KUBE_PS1=' $(kube_ps1) %{$reset_color%}'
P1_EXIT='%{$reset_color%}%(0?. . %{$PROMPT_FAILURE_COLOR%}[exit code %?]%{$reset_color%} )'
P2_NL=$'\n'
P2_ARROW='%{$PROMPT_PROMPT%}╚ᐅ%{$reset_color%} '

PROMPT="$P1_ARROW$P1_ICON$P1_BASE$P1_GITINFO$P1_KUBE_PS1$P1_EXIT$P2_NL$P2_ARROW"

#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⬇"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⬆"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⬆⬇"
