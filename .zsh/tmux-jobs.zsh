[[ -n $TMUX_PANE ]] || return 0

zmodload zsh/datetime
autoload -Uz add-zsh-hook

_tj_ignore=(nvim vim vimdiff k9s claude lazygit lazydocker yazi less man tuicr ssh tmux pgcli psql)

_tj_preexec() {
	(($_tj_ignore[(Ie)${${(z)2}[1]}])) && return 0
	_tj_start=$EPOCHSECONDS
	_tj_cmd="${(j: :)${(z)1}[1,2]}"
	tmux set -p -t "$TMUX_PANE" @job "▶ $_tj_start $_tj_cmd"
}

_tj_precmd() {
	local st=$? dur mark
	[[ -n $_tj_start ]] || return 0
	dur=$((EPOCHSECONDS - _tj_start))
	unset _tj_start
	if ((dur < ${TMUX_JOB_MIN:-30})) || [[ $(tmux display -p -t "$TMUX_PANE" '#{&&:#{window_active},#{session_attached}}') == 1 ]]; then
		tmux set -p -u -t "$TMUX_PANE" @job
		return 0
	fi
	((st == 0)) && mark=✓ || mark=✗
	if ((dur >= 3600)); then
		dur="$((dur / 3600))h$((dur % 3600 / 60))m"
	else
		dur="$((dur / 60))m$((dur % 60))s"
	fi
	tmux set -p -t "$TMUX_PANE" @job "$mark $_tj_cmd $dur"
}

add-zsh-hook preexec _tj_preexec
add-zsh-hook precmd _tj_precmd
