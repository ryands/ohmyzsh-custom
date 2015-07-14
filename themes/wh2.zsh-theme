#
# Warhead 2 Theme - Multiline prompt to show more info
#

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"

function prompt_char {
	[[ $UID == 0 ]] && pc="%{$fg_bold[red]%}#%{$reset_color%}" || pc="%{$fg_bold[blue]%}%%%{$reset_color%}"
	echo $pc
}

function prompt_git_branch {
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
	echo "${ref#refs/heads/}"
}

function prompt_git_status {
	branch=$(prompt_git_branch)
	dirty=$(parse_git_dirty)

	if ! [[ -z $branch ]]; then
		echo "$ZSH_THEME_GIT_PROMPT_PREFIX%{$fg_no_bold[green]%}${branch}%{$reset_color%} ${dirty}$ZSH_THEME_GIT_PROMPT_SUFFIX "
	fi
}

function prompt_ret_val {
	echo "%(?..%{$fg_bold[red]%}%?%{$reset_color%} )"
}

function prompt_user_host {
	echo "%{$fg_bold[white]%}%n%{$fg_bold[blue]%}@%{$fg_bold[white]%}%m"
}

function prompt_path_info {
	echo "%{$fg_bold[blue]%}[%{$fg_no_bold[green]%}%~%{$fg_bold[blue]%}]%{$reset_color%}"
}

function prompt_ruby_info {
	echo "%{$fg_bold[blue]%}[%{$fg_no_bold[green]%}ruby:$(rbenv_prompt_info)%{$fg_bold[blue]%}]%{$reset_color%} "
}

PROMPT='
 $(prompt_user_host) $(prompt_path_info) $(prompt_ruby_info)
 $(prompt_ret_val)$(prompt_git_status)$(prompt_char) '
