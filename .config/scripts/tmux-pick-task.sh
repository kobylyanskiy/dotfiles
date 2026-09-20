#!/bin/bash

selected=$( (
	printf '(none)\n'
	acli jira workitem search --jql "assignee = currentUser() AND statusCategory != Done ORDER BY updated DESC" \
		--fields summary,status --json 2>/dev/null |
		jq -r '.[] | "\(.key)\t\(.fields.status.name)\t\(.fields.summary)"' | column -ts $'\t'
) | sk --margin 5% --color=bw)

[[ $selected ]] || exit 0

if [[ $selected == "(none)" ]]; then
	tmux set -s -u @task
else
	tmux set -s @task "${selected%% *}"
	rm -f "${TMPDIR:-/tmp}/tmux-jira-${selected%% *}"
fi
tmux refresh-client -S
