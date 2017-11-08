PROMPT=$'
%F{008%}%n@%m %F{244%}%D{[%I:%M:%S]}%{$reset_color%} %{$fg[white]%}%~%{$reset_color%} \
 $(virtualenv_prompt_info)%{$FG[009]%}%B»%{$reset_color%} '
RPROMPT='${return_status} $(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

# https://github.com/tonyseek/oh-my-zsh-virtualenv-prompt
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{255}%F{012%}("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")%F{255} "

