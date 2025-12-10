#!/bin/bash

selected=$(fd . "$HOME/documents" --type=dir --max-depth=2 --min-depth=2 --full-path |
	sed "s|^$HOME/documents/||" |
	sk --margin 10% --color="bw")
[[ $selected ]] && selected="$HOME/documents/$selected"

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
echo "$selected_name"
echo "$selected"
if ! tmux has-session -t "$selected_name"; then
	echo "no session"
	tmux new-session -ds "$selected_name" -c "$selected"
	tmux select-window -t "$selected_name:1"
fi
tmux switch-client -t "$selected_name"
