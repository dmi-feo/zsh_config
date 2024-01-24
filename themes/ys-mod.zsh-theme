# Based on yc.theme Yad Smood from ohmyzsh package

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$c[reset]%}on%{$c[blue]%} "
YS_VCS_PROMPT_PREFIX2=":%{$c[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$c[reset]%}"
YS_VCS_PROMPT_DIRTY=" %{$c[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$c[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Virtualenv
local venv_info='$(virtenv_prompt)'
YS_THEME_VIRTUALENV_PROMPT_PREFIX=" %{$c[purple]%}[venv:"
YS_THEME_VIRTUALENV_PROMPT_SUFFIX="] %{$c[reset]%}%"
virtenv_prompt() {
	[[ -n "${VIRTUAL_ENV:-}" ]] || return
	echo "${YS_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUAL_ENV:t}${YS_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}

local exit_code="%(?,,C:%{$c[red]%}%?%{$c[reset]%})"

PROMPT="
%{$terminfo[bold]$c[blue]%}#%{$c[reset]%} \
%(#,%{$bg[yellow]%}%{$c[black]%}%n%{$c[reset]%},%{$c[cyan]%}%n) \
%{$c[reset]%}@ \
%{$c[green]%}%m \
%{$c[reset]%}in \
%{$terminfo[bold]$c[yellow]%}%~%{$c[reset]%}\
${git_info}\
${venv_info}\
 \
[%*] $exit_code
%{$terminfo[bold]$c[red]%}$ %{$c[reset]%}"
