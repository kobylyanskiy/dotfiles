#!/bin/bash

[[ -n $TMUX_PANE ]] || exit 0
command -v tmux >/dev/null 2>&1 || exit 0

if [[ -z $1 ]]; then
	tmux set -p -u -t "$TMUX_PANE" @job 2>/dev/null
	exit 0
fi

visible=$(tmux display -p -t "$TMUX_PANE" '#{&&:#{window_active},#{session_attached}}' 2>/dev/null)
[[ $visible == 1 ]] && exit 0

tmux set -p -t "$TMUX_PANE" @job "$1" 2>/dev/null
exit 0
