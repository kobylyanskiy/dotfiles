#!/bin/bash

now=$(date +%s)
min=${TMUX_JOB_MIN:-30}
out=()

fmt() {
	if (($1 >= 3600)); then
		printf '%dh%dm' "$(($1 / 3600))" "$(($1 % 3600 / 60))"
	else
		printf '%dm%ds' "$(($1 / 60))" "$(($1 % 60))"
	fi
}

while read -r win pane visible mark rest; do
	[[ -n $mark ]] || continue
	case $mark in
	▶)
		read -r start cmd <<<"$rest"
		((now - start >= min)) || continue
		[[ $visible == 1 ]] && continue
		out+=("#[fg=#e5c890]⏳ $win $cmd $(fmt $((now - start)))#[default]")
		;;
	✓)
		[[ $visible == 1 ]] && tmux set -p -u -t "$pane" @job && continue
		out+=("#[fg=#a6d189]✓ $win $rest#[default]")
		;;
	✗)
		[[ $visible == 1 ]] && tmux set -p -u -t "$pane" @job && continue
		out+=("#[fg=#e78284]✗ $win $rest#[default]")
		;;
	esac
done < <(tmux list-panes -a -F '#{session_name}:#{window_index} #{pane_id} #{&&:#{window_active},#{session_attached}} #{@job}')

((${#out[@]})) && printf '%s ' "${out[@]}"
