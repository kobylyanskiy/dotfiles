#!/bin/bash

items=$(acli jira workitem search --jql "assignee = currentUser() AND statusCategory != Done ORDER BY updated DESC" \
	--fields summary,status --json 2>/dev/null |
	jq -r '.[] | "\(.key)\t\(.fields.status.name)\t\(.fields.summary)"')

selected=$( (
	printf '(none)\n'
	printf '%s\n' "$items" | column -ts $'\t'
) | sk --margin 5% --color=bw)

[[ $selected ]] || exit 0

if [[ $selected == "(none)" ]]; then
	tmux set -s -u @task
	tmux set -s -u @task_slug
else
	key=${selected%% *}
	slug=$(printf '%s\n' "$items" | grep -m1 "^$key"$'\t' | cut -f3 |
		tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]' '-' | cut -c1-50)
	slug=${slug#-}
	slug=${slug%-}
	tmux set -s @task "$key"
	tmux set -s @task_slug "$slug"
	rm -f "${TMPDIR:-/tmp}/tmux-jira-$key"
fi
tmux refresh-client -S
