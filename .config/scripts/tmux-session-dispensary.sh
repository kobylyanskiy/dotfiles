#!/bin/bash

DIRS=(
	"$HOME/documents/tr"
	"$HOME/documents/opensource/"
)

selected=$(fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path |
	sed "s|^$HOME/||" |
	sk --margin 10% --color="bw")
[[ $selected ]] && selected="$HOME/$selected"

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
